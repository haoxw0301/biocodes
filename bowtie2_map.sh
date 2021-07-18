#!/bin/bash
#SBATCH -J bw2_0
#SBATCH -p shenxhlab
#SBATCH --cpus-per-task=18
#SBATCH -N 1
source /WORK/Samples/bio.sh


for i in `cat RBPs0`
do
base=$(basename ${i} "_1_1.fastq.gz")

mkdir ${base}/${base}_bowtie2

bowtie2 -p 18 -x /WORK/home/shexh/reference/human/hg38/hg38 -1 ${base}/${base}_fastp/P1_1.fastq.gz -2 ${base}/${base}_fastp/P1_2.fastq.gz -S ${base}/${base}_bowtie2/P1.sam

bowtie2 -p 18 -x /WORK/home/shexh/reference/human/hg38/hg38 -1 ${base}/${base}_fastp/P2_1.fastq.gz -2 ${base}/${base}_fastp/P2_2.fastq.gz -S ${base}/${base}_bowtie2/P2.sam

done
