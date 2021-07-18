#!/bin/bash
#SBATCH -J res
#SBATCH -p shenxhlab
#SBATCH --cpus-per-task=18
#SBATCH -N 1
source /WORK/Samples/bio.sh

mkdir res
sprint main -p 18 -rp ../dbrep/mm10_repeat.txt  -1 S1_r1.fastq -2 S1_r2.fastq ../mm10.fa res/S1 /WORK/app/bwa-0.7.12/bwa ../samtools-1.2/samtools

sprint main -p 18 -rp ../dbrep/mm10_repeat.txt  -1 S2_r1.fastq -2 S2_r2.fastq ../mm10.fa res/S2 /WORK/app/bwa-0.7.12/bwa ../samtools-1.2/samtools
