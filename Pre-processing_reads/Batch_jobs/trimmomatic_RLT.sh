#!/bin/bash
#SBATCH -J trimmomatic_RLT2						      # A single job name for the array
#SBATCH -n 16                               # Number of cores
#SBATCH -N 1                                # Number of nodes for the cores
#SBATCH -t 2-2:00                           # Runtime in D-HH:MM format
#SBATCH -p serial_requeue                   # Partition to submit to
#SBATCH --mem=500G                         # Memory pool for all CPUs
#SBATCH -o /n/home10/aromanosilva/trimmomatic/trimmomatic_RLT2.out     									# File to which standard out will be written
#SBATCH -e /n/home10/aromanosilva/trimmomatic/trimmomatic_RLT2.err      									# File to which standard err will be written
#SBATCH --mail-type=ALL                     # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  # Email to which notifications will be sent

module load jdk/1.8.0_172-fasrc01
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip
unzip Trimmomatic-0.39.zip

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG10_S123_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG10_S123_R2_001.fastq.gz AKG10_fp.fq.gz AKG10_fu.fq.gz AKG10_rp.fq.gz AKG10_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36 

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG17_S130_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG17_S130_R2_001.fastq.gz AKG17_fp.fq.gz AKG17_fu.fq.gz AKG17_rp.fq.gz AKG17_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG18_S131_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG18_S131_R2_001.fastq.gz AKG18_fp.fq.gz AKG18_fu.fq.gz AKG18_rp.fq.gz AKG18_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG1_S114_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG1_S114_R2_001.fastq.gz AKG1_fp.fq.gz AKG1_fu.fq.gz AKG1_rp.fq.gz AKG1_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG2_S115_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG2_S115_R2_001.fastq.gz AKG2_fp.fq.gz AKG2_fu.fq.gz AKG2_rp.fq.gz AKG2_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG3_S116_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG3_S116_R2_001.fastq.gz AKG3_fp.fq.gz AKG3_fu.fq.gz AKG3_rp.fq.gz AKG3_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG4_S117_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG4_S117_R2_001.fastq.gz AKG4_fp.fq.gz AKG4_fu.fq.gz AKG4_rp.fq.gz AKG4_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG5_S118_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG5_S118_R2_001.fastq.gz AKG5_fp.fq.gz AKG5_fu.fq.gz AKG5_rp.fq.gz AKG5_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG6_S119_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG6_S119_R2_001.fastq.gz AKG6_fp.fq.gz AKG6_fu.fq.gz AKG6_rp.fq.gz AKG6_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG7_S120_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG7_S120_R2_001.fastq.gz AKG7_fp.fq.gz AKG7_fu.fq.gz AKG7_rp.fq.gz AKG7_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG8_S121_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG8_S121_R2_001.fastq.gz AKG8_fp.fq.gz AKG8_fu.fq.gz AKG8_rp.fq.gz AKG8_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar PE /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG9_S122_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/RLT_ILT_PDC/AKG9_S122_R2_001.fastq.gz AKG9_fp.fq.gz AKG9_fu.fq.gz AKG9_rp.fq.gz AKG9_ru.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:23 MINLEN:36
