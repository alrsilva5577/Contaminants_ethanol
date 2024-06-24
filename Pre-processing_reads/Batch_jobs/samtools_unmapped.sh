#!/bin/bash
#SBATCH -J samtools_metagenomics			      # A single job name for the array
#SBATCH -n 16                               # Number of cores
#SBATCH -N 1                                # Number of nodes for the cores
#SBATCH -t 0-20:00                          # Runtime in D-HH:MM format
#SBATCH -p desai                            # Partition to submit to
#SBATCH --mem=60G                           # Memory pool for all CPUs
#SBATCH -o /n/home10/aromanosilva/unmapped_reads/samtools_metagenomics_unmapped.out      		# File to which standard out will be written
#SBATCH -e /n/home10/aromanosilva/unmapped_reads/samtools_metagenomics_unmapped.err      		# File to which standard err will be written
#SBATCH --mail-type=ALL                     # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  # Email to which notifications will be sent

module load samtools

for i in 1 3 7 9 17 21 27 37 47 57 67 97 109 127 157 167 187 217 227; do samtools view -f 4 /n/desai_lab/users/andygombert/output_Bwa/UIR${i}_bwa.sam > unmapped_UIR${i}.sam; grep -v "NC" unmapped_UIR${i}.sam | wc -l > n_reads_UIR${i}.txt; done

for i in 1 7 9 21 27 37 47 57 67 77 87 97 109 127 147 157 167 187 197 201 203; do samtools view -f 4 /n/desai_lab/users/andygombert/output_Bwa/UCP${i}_bwa.sam > unmapped_UCP${i}.sam; grep -v "NC" unmapped_UCP${i}.sam | wc -l > n_reads_UCP${i}.txt; done

for i in 1 8 13 27 38 51 65 77 92 107 119 134 150 163 174; do samtools view -f 4 /n/desai_lab/users/andygombert/output_Bwa/UIR${i}_2019_bwa.sam > unmapped_UIR${i}_2019.sam; grep -v "NC" unmapped_UIR${i}_2019.sam | wc -l > n_reads_UIR${i}_2019.txt; done

for i in 1 5 13 28 40 54 67 81 95 109 123 137 151 172 184; do samtools view -f 4 /n/desai_lab/users/andygombert/output_Bwa/UCP${i}_2019_bwa.sam > unmapped_UCP${i}_2019.sam; grep -v "NC" unmapped_UCP${i}_2019.sam | wc -l > n_reads_UCP${i}_2019.txt; done
