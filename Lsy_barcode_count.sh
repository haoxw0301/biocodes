#!/bin/bash
#SBATCH -J count
#SBATCH -p shenxhlab
#SBATCH --ntasks=2
#SBATCH -N 1
while  read line;
  do
    echo $line | awk '{print $1}'  > barcode_f.txt
    echo $line | grep -o "DNA"| wc -l > count_f.txt
    paste   barcode_f.txt count_f.txt;
  done < SPRITE05.S2.labeled.cluster > SPRITE05.S2.labeled.cluster_count

  while  read line;
    do
      echo $line | awk '{print $1}'  > barcode.txt
      echo $line | grep -o "DNA"| wc -l > count.txt
      paste   barcode.txt count.txt;
    done < SPRITE05.mouse.labeled.cluster > SPRITE05.mouse.labeled.cluster_count
