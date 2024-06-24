#!/bin/bash
#SBATCH -J bwa		 					 # A single job name for the array
#SBATCH -n 8                # Number of cores
#SBATCH -N 1                 # Number of nodes for the cores
#SBATCH -t 0-10:00           # Runtime in D-HH:MM format
#SBATCH -p desai    # Partition to submit to
#SBATCH --mem=120G           # Memory pool for all CPUs
#SBATCH -o /n/desai_lab/users/aromanosilva/bwa/bwa.out     # File to which standard out will be written
#SBATCH -e /n/desai_lab/users/aromanosilva/bwa/bwa.err     # File to which standard err will be written
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  #Email to which notifications will be sent

module load bwa/0.7.15-fasrc02
module load samtools

for i in {40..48}
do 
	bwa mem -M -t 7 -R "@RG\tID:HTLMC.1\tSM:AKG${i}\tPL:ILLUMINA" GCF_000146045.2_R64_genomic /n/home10/aromanosilva/ngmerge/AKG${i}_trimmed.fwd.fq.gz /n/home10/aromanosilva/ngmerge/AKG${i}_trimmed.rev.fq.gz | samtools fastq -f 4 -1 AKG${i}_unmapped_fwd.fastq -2 AKG${i}_unmapped_rev.fastq; 
	done

for i in {138..153}
do
        bwa mem -M -t 7 -R "@RG\tID:HTLMC.1\tSM:AKG${i}\tPL:ILLUMINA" GCF_000146045.2_R64_genomic /n/home10/aromanosilva/ngmerge/AKG${i}_trimmed.fwd.fq.gz /n/home10/aromanosilva/ngmerge/AKG${i}_trimmed.rev.fq.gz | samtools fastq -f 4 -1 AKG${i}_unmapped_fwd.fastq -2 AKG${i}_unmapped_rev.fastq;
        done