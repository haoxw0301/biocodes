#!/bin/bash
#SBATCH -J htseq
#SBATCH -p shenxhlab
#SBATCH --cpus-per-task=18
#SBATCH -N 1
source /WORK/Samples/bio.sh


htseq-count  -i gene_id -m union chromatin_rna.bowtie2.sort.bam ../../../reference/mm9/mm9.refGene.gtf > reads_count.txt 
