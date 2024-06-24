#!/bin/bash
#SBATCH -J trimmomatic_12042						      # A single job name for the array
#SBATCH -n 16                               # Number of cores
#SBATCH -N 1                                # Number of nodes for the cores
#SBATCH -t 2-2:00                           # Runtime in D-HH:MM format
#SBATCH -p serial_requeue                   # Partition to submit to
#SBATCH --mem=700G                         # Memory pool for all CPUs
#SBATCH -o /n/home10/aromanosilva/trimmomatic/trimmomatic_12042.out     										# File to which standard out will be written
#SBATCH -e /n/home10/aromanosilva/trimmomatic/trimmomatic_12042.err      									# File to which standard err will be written
#SBATCH --mail-type=ALL                     # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  # Email to which notifications will be sent

module load jdk/1.8.0_172-fasrc01

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG125_S2_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG125_S2_L001_R2_001.fastq.gz AKG125_fp.fq.gz AKG125_fu.fq.gz AKG125_rp.fq.gz AKG125_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG126_S3_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG126_S3_L001_R2_001.fastq.gz AKG126_fp.fq.gz AKG126_fu.fq.gz AKG126_rp.fq.gz AKG126_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG127_S4_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG127_S4_L001_R2_001.fastq.gz AKG127_fp.fq.gz AKG127_fu.fq.gz AKG127_rp.fq.gz AKG127_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG128_S5_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG128_S5_L001_R2_001.fastq.gz AKG128_fp.fq.gz AKG128_fu.fq.gz AKG128_rp.fq.gz AKG128_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG129_S6_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG129_S6_L001_R2_001.fastq.gz AKG129_fp.fq.gz AKG129_fu.fq.gz AKG129_rp.fq.gz AKG129_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG130_S7_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG130_S7_L001_R2_001.fastq.gz AKG130_fp.fq.gz AKG130_fu.fq.gz AKG130_rp.fq.gz AKG130_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG131_S8_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG131_S8_L001_R2_001.fastq.gz AKG131_fp.fq.gz AKG131_fu.fq.gz AKG131_rp.fq.gz AKG131_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG132_S9_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG132_S9_L001_R2_001.fastq.gz AKG132_fp.fq.gz AKG132_fu.fq.gz AKG132_rp.fq.gz AKG132_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG133_S10_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG133_S10_L001_R2_001.fastq.gz AKG133_fp.fq.gz AKG133_fu.fq.gz AKG133_rp.fq.gz AKG133_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG134_S11_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG134_S11_L001_R2_001.fastq.gz AKG134_fp.fq.gz AKG134_fu.fq.gz AKG134_rp.fq.gz AKG134_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG135_S12_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG135_S12_L001_R2_001.fastq.gz AKG135_fp.fq.gz AKG135_fu.fq.gz AKG135_rp.fq.gz AKG135_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG136_S13_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG136_S13_L001_R2_001.fastq.gz AKG136_fp.fq.gz AKG136_fu.fq.gz AKG136_rp.fq.gz AKG136_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG137_S14_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG137_S14_L001_R2_001.fastq.gz AKG137_fp.fq.gz AKG137_fu.fq.gz AKG137_rp.fq.gz AKG137_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG138_S15_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG138_S15_L001_R2_001.fastq.gz AKG138_fp.fq.gz AKG138_fu.fq.gz AKG138_rp.fq.gz AKG138_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG139_S16_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG139_S16_L001_R2_001.fastq.gz AKG139_fp.fq.gz AKG139_fu.fq.gz AKG139_rp.fq.gz AKG139_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG140_S17_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG140_S17_L001_R2_001.fastq.gz AKG140_fp.fq.gz AKG140_fu.fq.gz AKG140_rp.fq.gz AKG140_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG141_S18_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG141_S18_L001_R2_001.fastq.gz AKG141_fp.fq.gz AKG141_fu.fq.gz AKG141_rp.fq.gz AKG141_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG142_S19_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG142_S19_L001_R2_001.fastq.gz AKG142_fp.fq.gz AKG142_fu.fq.gz AKG142_rp.fq.gz AKG142_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG143_S20_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG143_S20_L001_R2_001.fastq.gz AKG143_fp.fq.gz AKG143_fu.fq.gz AKG143_rp.fq.gz AKG143_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG144_S21_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG144_S21_L001_R2_001.fastq.gz AKG144_fp.fq.gz AKG144_fu.fq.gz AKG144_rp.fq.gz AKG144_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG145_S22_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG145_S22_L001_R2_001.fastq.gz AKG145_fp.fq.gz AKG145_fu.fq.gz AKG145_rp.fq.gz AKG145_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG146_S23_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG146_S23_L001_R2_001.fastq.gz AKG146_fp.fq.gz AKG146_fu.fq.gz AKG146_rp.fq.gz AKG146_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG147_S24_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG147_S24_L001_R2_001.fastq.gz AKG1047_fp.fq.gz AKG147_fu.fq.gz AKG147_rp.fq.gz AKG147_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG148_S25_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG148_S25_L001_R2_001.fastq.gz AKG148_fp.fq.gz AKG148_fu.fq.gz AKG148_rp.fq.gz AKG148_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG149_S26_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG149_S26_L001_R2_001.fastq.gz AKG149_fp.fq.gz AKG149_fu.fq.gz AKG149_rp.fq.gz AKG149_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG150_S27_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG150_S27_L001_R2_001.fastq.gz AKG150_fp.fq.gz AKG150_fu.fq.gz AKG150_rp.fq.gz AKG150_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG151_S28_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG151_S28_L001_R2_001.fastq.gz AKG151_fp.fq.gz AKG151_fu.fq.gz AKG151_rp.fq.gz AKG151_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG152_S29_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG152_S29_L001_R2_001.fastq.gz AKG152_fp.fq.gz AKG152_fu.fq.gz AKG152_rp.fq.gz AKG152_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG153_S30_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG153_S30_L001_R2_001.fastq.gz AKG153_fp.fq.gz AKG153_fu.fq.gz AKG153_rp.fq.gz AKG153_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36
