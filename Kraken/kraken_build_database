#!/bin/bash
#SBATCH -J build_db_ago-2022 					 # A single job name for the array
#SBATCH -n 24                # Number of cores
#SBATCH -N 1                 # Number of nodes for the cores
#SBATCH -t 10-00:00           # Runtime in D-HH:MM format
#SBATCH -p desai    # Partition to submit to
#SBATCH --mem=120G           # Memory pool for all CPUs
#SBATCH -o /n/desai_lab/users/aromanosilva/kraken/build_db_ago-2022.out     # File to which standard out will be written
#SBATCH -e /n/desai_lab/users/aromanosilva/kraken/build_db_ago-2022.err     # File to which standard err will be written
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  #Email to which notifications will be sent

./kraken2-build --download-library archaea --threads 24 --db db_ago-2022 --no-masking
./kraken2-build --download-library bacteria --threads 24 --db db_ago-2022 --no-masking
./kraken2-build --download-library fungi --threads 24 --db db_ago-2022 --no-masking
./kraken2-build --download-library viral --threads 24 --db db_ago-2022 --no-masking
./kraken2-build --download-taxonomy --db db_ago-2022

./kraken2-build --build --threads 24 --db db_ago-2022 --no-masking
