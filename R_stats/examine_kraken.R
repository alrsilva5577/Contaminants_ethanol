rm(list = ls())

# PREAMBLE ==============================================
library(reshape2)
library(ggplot2)
library(Rtsne)
library(plyr)
library(PerformanceAnalytics)
library(gtools)

# Function for plotting PCA loadings on a PCA plot with ggplot
# loading_factor : scales arrows
# min_load : minimum loading value to plot an arrow for
geom_loading <- function(data, xvar, yvar, labelvar = NULL,
                         loading_factor = 10, min_load = 0, arrow_length = 0.5, ...){
  keep_ids <- which(abs(data[,xvar]) >= min_load | abs(data[,yvar]) >= min_load)
  out1 <- geom_segment(data = data[keep_ids,c(xvar, yvar)],
                       aes_string(x = 0, y = 0, 
                                  xend = paste0(xvar, "*loading_factor"), 
                                  yend = paste0(yvar, "*loading_factor")),
                       arrow = arrow(length = unit(arrow_length, "picas")), ...)
  if(!is.null(labelvar)){
    out2 <- geom_text(data = data[keep_ids, c(labelvar, xvar, yvar)],
                      aes_string(x = paste0(xvar, "*loading_factor"), 
                                 y = paste0(yvar, "*loading_factor"),
                                 label = labelvar))
    return(list(out1, out2))
  }
  return(out1)
}

# CODE ==================================================
# Import kraken results and drop Homo genus
dat <- read.table("data/kraken_results.txt", header = T, check.names = F)
dat <- dat[,names(dat) != "Homo"]
dat <- dat[,names(dat) != "Cellulosimicrobium"]
datcols <- names(dat)[-(1:5)]
idcols <- names(dat)[1:5]

# Melt data, order genus from most to least frequent
datm <- melt(dat, id.vars = idcols, 
             variable.name = "genus", value.name = "freq")

datm$genus <- factor(as.character(datm$genus), 
                     datcols[order(apply(dat[,datcols], 2, median), decreasing = T)])

# Import fermentation metrics for UCP
metric_ucp2018 <- read.table("data/fermentation_UCP_2018.txt", header = T, check.names = T)
metric_ucp2019 <- read.table("data/fermentation_UCP_2019.txt", header = T, check.names = T)
metrics_ucp <- rbind(metric_ucp2018, metric_ucp2019)

idcols_met <- names(metrics_ucp)[1:5]
datcols_met <- names(metrics_ucp)[-(1:5)]

chart.Correlation(metrics_ucp[,datcols_met], histogram=TRUE, pch=19)

# Import contamination metrics for UIR
cont_uir2018 <- read.table("data/contamination_UIR_2018.txt", header = T, check.names = F)
cont_uir2019 <- read.table("data/contamination_UIR_2019.txt", header = T, check.names = F)
metric_uir2018 <- read.table("data/fermentation_UIR_2018.txt", header = T, check.names = F)

cont_uir2018 <- merge(cont_uir2018, metric_uir2018, by = c("day_sampling", "vat"))
cont_uir2018 <- data.frame(year = 2018, cont_uir2018)
cont_uir2019 <- data.frame(year = 2019, cont_uir2019)

cont_uir2018 <- cont_uir2018[,names(cont_uir2018) != "vat"]
cont_uir2019 <- cont_uir2019[,names(cont_uir2019) != "vat"]

cont_uir <- smartbind(cont_uir2018, cont_uir2019)

idcols_cont <- names(cont_uir)[1:2]
datcols_cont <- names(cont_uir)[-(1:2)]

chart.Correlation(cont_uir[,datcols_cont], histogram=TRUE, pch=19)

# Plot individual lineage freqs
ggplot(datm, aes(day_sampling, freq, group = genus)) +
  facet_grid(site~year, scales = "free_x") +
  geom_area(aes(fill = genus), color = "grey20", linewidth = 0.2) +
  coord_cartesian(ylim = c(0, 100)) +
  theme_bw()

# Do PCA over all data points
pc1 <- prcomp(dat[,datcols], center = T, scale = F)
plot(pc1$sdev)
pc1mat <- cbind(dat[,idcols], pc1$x)
pc1load <- cbind(data.frame(genus = row.names(pc1$rotation)), as.data.frame(pc1$rotation))

ggplot(pc1mat, aes(PC1, PC2)) +
  geom_point(aes(col = paste0(site, "_", year))) +
  geom_loading(data = pc1load, xvar = "PC1", yvar = "PC2", labelvar = "genus",
               loading_factor = 30, min_load = 0.02) +
  labs(color = "") +
  scale_x_continuous(breaks = seq(-100, 100, 10)) +
  scale_y_continuous(breaks = seq(-100, 100, 10)) +
  coord_equal() +
  theme_bw()

ggplot(pc1mat, aes(PC3, PC2)) +
  geom_point(aes(col = paste0(site, "_", year))) +
  geom_loading(data = pc1load, xvar = "PC3", yvar = "PC2", labelvar = "genus",
               loading_factor = 10, min_load = 0.3) +
  labs(color = "") +
  scale_x_continuous(breaks = seq(-100, 100, 10)) +
  scale_y_continuous(breaks = seq(-100, 100, 10)) +
  coord_equal() +
  theme_bw()

# Interpret PC1
b1 <- pc1mat[,c(idcols, "PC1")]
b1 <- merge(b1, datm)
b1$cutPC1 <- cut(b1$PC1, breaks = 10)
b1 <- ddply(b1, c("cutPC1", "genus"), function(x) {
  out <- x[1,]
  out$freq <- sum(x$freq)
  return(out)
})
b1 <- ddply(b1, c("cutPC1"), function(x) {
  x$norm_freq <- x$freq/sum(x$freq)
  return(x)
})
ggplot(b1, aes(cutPC1, norm_freq)) +
  geom_bar(aes(fill = genus), col = "grey20", stat = "identity") +
  theme_bw()

# Interpret PC2
b2 <- pc1mat[,c(idcols, "PC1", "PC2")]
b2 <- merge(b2, datm)
b2$cutPC1 <- cut(b2$PC1, breaks = 5)
b2$cutPC2 <- cut(b2$PC2, breaks = 5)
b2 <- ddply(b2, c("cutPC1", "cutPC2", "genus"), function(x) {
  out <- x[1,]
  out$freq <- sum(x$freq)
  return(out)
})
b2 <- ddply(b2, c("cutPC1", "cutPC2"), function(x) {
  x$norm_freq <- x$freq/sum(x$freq)
  return(x)
})
ggplot(b2, aes(1, norm_freq)) +
  facet_grid(cutPC2~cutPC1) +
  geom_bar(aes(fill = genus), col = "grey20", stat = "identity") +
  theme_bw()

# Relate PCs with fermentation metrics for UCP
## Approximate metrics to days of sequencing sampling
metrics_adj <- ldply(2018:2019, function(year){
  days_in <- metrics_ucp$day_count[metrics_ucp$year == year]
  days_out <- pc1mat$day_sampling[pc1mat$site == "UCP" & pc1mat$year == year]
  
  out <- sapply(6:18, function(col){
    metric <- metrics_ucp[metrics_ucp$year == year, col]
    out <- approx(days_in, metric, days_out)$y
    return(out)
  })
  out <- as.data.frame(out)
  names(out) <- names(metrics_ucp)[6:18]
  out <- data.frame(year = year, day_sampling = days_out, out)
  return(out)  
})

## Merge adjusted metrics with PCA data
metrics_adj <- merge(metrics_adj, pc1mat[pc1mat$site == "UCP", c("year", "day_sampling", "PC1", "PC2")])

## Melt data
metrics_adjm <- melt(metrics_adj, id.vars = c("year", "day_sampling", "PC1", "PC2"),
                     variable.name = "metric", value.name = "value")

## Plot metrics against PC1 and PC2
## Note that PC2 has two outlier values that should better be removed before doing linear regressions.
ggplot(metrics_adjm, aes(PC1, value)) +
  facet_wrap(metric~., scale = "free") +
  geom_smooth(method = "lm", formula = "y~x", color = "grey20", linewidth = 0.4) +
  geom_point(aes(color = as.factor(year))) +
  scale_color_brewer(palette = "Set1") +
  theme_bw()

ggplot(metrics_adjm, aes(PC2, value)) +
  facet_wrap(metric~., scale = "free") +
  geom_smooth(method = "lm", formula = "y~x", color = "grey20", linewidth = 0.4) +
  geom_point(aes(color = as.factor(year))) +
  scale_color_brewer(palette = "Set1") +
  theme_bw()

# Regress different metrics on PC1 and PC2
lm1 <- lm(solids_must~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(art_must~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(art_wine~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(brix_must~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(kacidity~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(kart~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(kglycerol~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(gl_vat~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(ph_must~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(ph_wine~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(output~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(yield~PC1+PC2, metrics_adj)
summary(lm1)
lm1 <- lm(temperature~PC1+PC2, metrics_adj)
summary(lm1)

# Relate PCs with contamination metrics of UIR
## Merge contamination data with PCA data
cont_uir <- merge(cont_uir, pc1mat[pc1mat$site == "UIR", c("year", "day_sampling", "PC1", "PC2")])

## Melt data
contm <- melt(cont_uir, id.vars = c("year", "day_sampling", "PC1", "PC2"),
              variable.name = "metric", value.name = "value")

## Plot metrics against PC1, PC2, and acid
## Note that PC2 has two outlier values that should better be removed before doing linear regressions.
ggplot(contm, aes(PC1, value)) +
  facet_wrap(metric~., scale = "free") +
  geom_smooth(method = "lm", formula = "y~x", color = "grey20", linewidth = 0.4) +
  geom_point(aes(color = as.factor(year))) +
  scale_color_brewer(palette = "Set1") +
  theme_bw()

ggplot(contm, aes(PC2, value)) +
  facet_wrap(metric~., scale = "free") +
  geom_smooth(method = "lm", formula = "y~x", color = "grey20", linewidth = 0.4) +
  geom_point(aes(color = as.factor(year))) +
  scale_color_brewer(palette = "Set1") +
  theme_bw()

# Regress different metrics on PC1 and PC2
lm1 <- lm(yeast_viability~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(budding_rate~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(budding_viability~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(floc~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(temp~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(rods~PC1+PC2, cont_uir)
summary(lm1)

lm1 <- lm(operation_time~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(yield_byproduct~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(yield_redox~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(atr~PC1+PC2, cont_uir)
summary(lm1)
lm1 <- lm(production~PC1+PC2, cont_uir)
summary(lm1)
