for i in `cat RBPs0`
do
  base=$(basename ${i} "_1_1.fastq.gz")

  echo "#!/bin/bash" > ${base}.sh
  echo "#SBATCH -J ${base}.map" >> ${base}.sh
  echo "#SBATCH -p shenxhlab" >> ${base}.sh
  echo "#SBATCH --nodes=1" >> ${base}.sh

  echo "#SBATCH --cpus-per-task=18" >> ${base}.sh
  echo "source /WORK/Samples/bio.sh
mkdir ${base}/${base}_fastp

/WORK/app/fastp -i ${base}/${base}_2_1.fastq.gz -o ${base}/${base}_fastp/${base}_2_1.fastq.gz -I ${base}/${base}_2_2.fastq.gz -O ${base}/${base}_fastp/${base}_2_2.fastq.gz

mkdir ${base}/${base}_STAR

STAR --runThreadN 18   --genomeDir ../../reference/hg38/STAR-index --readFilesIn ${base}/${base}_fastp/${base}_2_1.fastq.gz ${base}/${base}_fastp/${base}_2_2.fastq.gz  --readFilesCommand zcat --outFileNamePrefix ${base}/${base}_STAR/${base}_2  --outSAMtype BAM SortedByCoordinate" >> ${base}.sh
  sbatch ${base}.sh
done
