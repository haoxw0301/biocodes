#!/bin/bash
#SBATCH -J atac-e
#SBATCH -p shenxhlab
#SBATCH --cpus-per-task=18
#SBATCH -N 1
source /WORK/Samples/bio.sh

mkdir fastp
/WORK/app/fastp -i  B1_KO_2C_ATAC_QH1463_rep2_seq1_R1.fastq.gz -o  fastp/B1_KO_2C_ATAC_QH1463_rep2_seq1_R1.fastq.gz  -I  B1_KO_2C_ATAC_QH1463_rep2_seq1_R2.fastq.gz  -O  fastp/B1_KO_2C_ATAC_QH1463_rep2_seq1_R2.fastq.gz

mkdir bowtie2

bowtie2 -p 18 -x /WORK/home/shexh/haoxw/reference/mm10/bowtie2-index/mm10 -1 fastp/B1_KO_2C_ATAC_QH1463_rep2_seq1_R1.fastq.gz  -2 fastp/B1_KO_2C_ATAC_QH1463_rep2_seq1_R1.fastq.gz -S bowtie2/B1_KO_2C_ATAC_QH1463.sam

samtools view --threads 18 -b -S bowtie2/B1_KO_2C_ATAC_QH1463.sam -o bowtie2/B1_KO_2C_ATAC_QH1463.bam

samtools sort --threads 18  bowtie2/B1_KO_2C_ATAC_QH1463.bam -o bowtie2/B1_KO_2C_ATAC_QH1463.bam

samtools index bowtie2/B1_KO_2C_ATAC_QH1463.bam

## callpeak
mkdir macs2
macs2 callpeak -t bowtie2/B1_KO_2C_ATAC_QH1463.bam -n B1_KO_2C_ATAC --outdir macs2 -f BAMPE -g hs --nomodel --keep-dup all --cutoff-analysis --bdg
