#!/bin/bash
#SBATCH -J NGmerge 					 # A single job name for the array
#SBATCH -n 32                # Number of cores
#SBATCH -N 1                 # Number of nodes for the cores
#SBATCH -t 0-20:00           # Runtime in D-HH:MM format
#SBATCH -p serial_requeue    # Partition to submit to
#SBATCH --mem=120G           # Memory pool for all CPUs
#SBATCH -o /n/home10/aromanosilva/ngmerge/ngmerge.out     # File to which standard out will be written
#SBATCH -e /n/home10/aromanosilva/ngmerge/ngmerge.err     # File to which standard err will be written
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  #Email to which notifications will be sent

module load NGmerge/0.2-fasrc01

for i in {28..48}; do NGmerge -1 /n/home10/aromanosilva/trimmomatic/AKG${i}_fp.fq.gz -2 /n/home10/aromanosilva/trimmomatic/AKG${i}_rp.fq.gz -a -v -o AKG${i}_trimmed; done