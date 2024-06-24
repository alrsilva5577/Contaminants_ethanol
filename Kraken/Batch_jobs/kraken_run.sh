#!/bin/bash
#SBATCH -J run_kraken 					 # A single job name for the array
#SBATCH -n 32                # Number of cores
#SBATCH -N 1                 # Number of nodes for the cores
#SBATCH -t 2-00:00           # Runtime in D-HH:MM format
#SBATCH -p desai    # Partition to submit to
#SBATCH --mem=120G           # Memory pool for all CPUs
#SBATCH -o /n/desai_lab/users/aromanosilva/kraken/run_kraken.out     # File to which standard out will be written
#SBATCH -e /n/desai_lab/users/aromanosilva/kraken/run_kraken.err     # File to which standard err will be written
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=a163861@dac.unicamp.br  #Email to which notifications will be sent


for i in {1..18};
	do ./kraken2 --db database2 --use-names --paired /n/desai_lab/users/aromanosilva/reads_filtered/AKG${i}_filtered_1.fq /n/desai_lab/users/aromanosilva/reads_filtered/AKG${i}_filtered_2.fq --report AKG${i}_report_kraken.txt --output AKG${i}_out_kraken.txt;
done


for i in {27..48};
	do ./kraken2 --db database2 --use-names --paired /n/desai_lab/users/aromanosilva/reads_filtered/AKG${i}_filtered_1.fq /n/desai_lab/users/aromanosilva/reads_filtered/AKG${i}_filtered_2.fq --report AKG${i}_report_kraken.txt --output AKG${i}_out_kraken.txt;
done

for i in {124..153};
	do ./kraken2 --db database2 --use-names --paired /n/desai_lab/users/aromanosilva/reads_filtered/AKG${i}_filtered_1.fq /n/desai_lab/users/aromanosilva/reads_filtered/AKG${i}_filtered_2.fq --report AKG${i}_report_kraken.txt --output AKG${i}_out_kraken.txt;
done



./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG49_S23_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG49_S23_R2_001.fastq.gz --report c_AKG49_report_kraken.txt --output c_AKG49_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG53_S27_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG53_S27_R2_001.fastq.gz --report c_AKG53_report_kraken.txt --output c_AKG53_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG56_S30_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG56_S30_R2_001.fastq.gz --report c_AKG56_report_kraken.txt --output c_AKG56_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG71_S45_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG71_S45_R2_001.fastq.gz --report c_AKG71_report_kraken.txt --output c_AKG71_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG92_S66_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG92_S66_R2_001.fastq.gz --report c_AKG92_report_kraken.txt --output c_AKG92_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG110_S84_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20190813/AKG110_S84_R2_001.fastq.gz --report c_AKG110_report_kraken.txt --output c_AKG110_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG157_S34_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG157_S34_L001_R2_001.fastq.gz --report c_AKG157_report_kraken.txt --output c_AKG157_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG171_S48_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG171_S48_L001_R2_001.fastq.gz --report c_AKG171_report_kraken.txt --output c_AKG171_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG188_S65_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG188_S65_L001_R2_001.fastq.gz --report c_AKG188_report_kraken.txt --output c_AKG188_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG197_S74_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG197_S74_L001_R2_001.fastq.gz --report c_AKG197_report_kraken.txt --output c_AKG197_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG206_S83_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG206_S83_L001_R2_001.fastq.gz --report c_AKG206_report_kraken.txt --output c_AKG206_out_kraken.txt

./../kraken/kraken2 --db /n/desai_lab/users/aromanosilva/kraken/database2 --use-names --paired /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG217_S94_L001_R1_001.fastq.gz /n/desai_lab/users/andygombert/illuminareads/AKG_20191204/AKG217_S94_L001_R2_001.fastq.gz --report c_AKG217_report_kraken.txt --output c_AKG217_out_kraken.txt
