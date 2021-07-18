#!/bin/sh
for i in `cat id`
do
        echo "#!/bin/sh" > $i.trim.sh
        echo "#SBATCH -J $i.trim" >> $i.trim.sh
        echo "#SBATCH -p shenxhlab" >> $i.trim.sh
        echo "#SBATCH --nodes=1" >> $i.trim.sh
        echo "#SBATCH --ntasks=3" >> $i.trim.sh
        echo "#SBATCH --output=$i.out" >> $i.trim.sh
        echo "#SBATCH --error=$i.err" >> $i.trim.sh
        echo "source /WORK/Samples/bio.sh" >> $i.trim.sh
        echo "/WORK/app/fastp -i ${i}_L1_1fq.gz -o trim/${i}_L1_1fq.gz -I ${i}_L2_1fq.gz -O trim/${i}_L2_1fq.gz" >> $i.trim.sh
        sbatch $i.trim.sh
done
~
~
~
~
~
~
