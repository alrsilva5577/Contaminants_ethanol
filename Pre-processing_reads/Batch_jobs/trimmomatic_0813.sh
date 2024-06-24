#!/bin/bash
#SBATCH -J trimmomatic_0813		    # A single job name for the array
#SBATCH -n 16                               # Number of cores
#SBATCH -N 1                                # Number of nodes for the cores
#SBATCH -t 2-2:00                           # Runtime in D-HH:MM format
#SBATCH -p serial_requeue                   # Partition to submit to
#SBATCH --mem=1000G                         # Memory pool for all CPUs
#SBATCH -o /n/home10/aromanosilva/trimmomatic/trimmomatic_0813.out     										# File to which standard out will be written
#SBATCH -e /n/home10/aromanosilva/trimmomatic/trimmomatic_0813.err      									# File to which standard err will be written
#SBATCH --mail-type=ALL                     # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  # Email to which notifications will be sent

module load jdk/1.8.0_172-fasrc01

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG27_S1_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG27_S1_R2_001.fastq.gz AKG27_fp.fq.gz AKG27_fu.fq.gz AKG27_rp.fq.gz AKG27_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG28_S2_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG28_S2_R2_001.fastq.gz AKG28_fp.fq.gz AKG28_fu.fq.gz AKG28_rp.fq.gz AKG28_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG29_S3_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG29_S3_R2_001.fastq.gz AKG29_fp.fq.gz AKG29_fu.fq.gz AKG29_rp.fq.gz AKG29_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG30_S4_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG30_S4_R2_001.fastq.gz AKG30_fp.fq.gz AKG30_fu.fq.gz AKG30_rp.fq.gz AKG30_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG31_S5_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG31_S5_R2_001.fastq.gz AKG31_fp.fq.gz AKG31_fu.fq.gz AKG31_rp.fq.gz AKG31_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG32_S6_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG32_S6_R2_001.fastq.gz AKG32_fp.fq.gz AKG32_fu.fq.gz AKG32_rp.fq.gz AKG32_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG33_S7_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG33_S7_R2_001.fastq.gz AKG33_fp.fq.gz AKG33_fu.fq.gz AKG33_rp.fq.gz AKG33_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG34_S8_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG34_S8_R2_001.fastq.gz AKG34_fp.fq.gz AKG34_fu.fq.gz AKG34_rp.fq.gz AKG34_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG35_S9_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG35_S9_R2_001.fastq.gz AKG35_fp.fq.gz AKG35_fu.fq.gz AKG35_rp.fq.gz AKG35_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG36_S10_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG36_S10_R2_001.fastq.gz AKG36_fp.fq.gz AKG36_fu.fq.gz AKG36_rp.fq.gz AKG36_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG37_S11_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG37_S11_R2_001.fastq.gz AKG37_fp.fq.gz AKG37_fu.fq.gz AKG37_rp.fq.gz AKG37_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG38_S12_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG38_S12_R2_001.fastq.gz AKG38_fp.fq.gz AKG38_fu.fq.gz AKG38_rp.fq.gz AKG38_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG39_S13_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG39_S13_R2_001.fastq.gz AKG39_fp.fq.gz AKG39_fu.fq.gz AKG39_rp.fq.gz AKG39_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG40_S14_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG40_S14_R2_001.fastq.gz AKG40_fp.fq.gz AKG40_fu.fq.gz AKG40_rp.fq.gz AKG40_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG41_S15_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG41_S15_R2_001.fastq.gz AKG41_fp.fq.gz AKG41_fu.fq.gz AKG41_rp.fq.gz AKG41_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG42_S16_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG42_S16_R2_001.fastq.gz AKG42_fp.fq.gz AKG42_fu.fq.gz AKG42_rp.fq.gz AKG42_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG43_S17_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG43_S17_R2_001.fastq.gz AKG43_fp.fq.gz AKG43_fu.fq.gz AKG43_rp.fq.gz AKG43_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG44_S18_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG44_S18_R2_001.fastq.gz AKG44_fp.fq.gz AKG44_fu.fq.gz AKG44_rp.fq.gz AKG44_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG45_S19_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG45_S19_R2_001.fastq.gz AKG45_fp.fq.gz AKG45_fu.fq.gz AKG45_rp.fq.gz AKG45_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG46_S20_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG46_S20_R2_001.fastq.gz AKG46_fp.fq.gz AKG46_fu.fq.gz AKG46_rp.fq.gz AKG46_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG47_S21_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG47_S21_R2_001.fastq.gz AKG47_fp.fq.gz AKG47_fu.fq.gz AKG47_rp.fq.gz AKG47_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG48_S22_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG48_S22_R2_001.fastq.gz AKG48_fp.fq.gz AKG48_fu.fq.gz AKG48_rp.fq.gz AKG48_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36
