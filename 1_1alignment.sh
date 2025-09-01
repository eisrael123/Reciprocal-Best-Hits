#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --nodes=1
#SBATCH --output=output_%j.log   # STDOUT
#SBATCH --error=error_%j.log     # STDERR
set -e 

# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_file_1.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_file_2.txt"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_output.tsv"


blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_human_against_zfish.txt"
blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_zfish_against_human.txt"
biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/human_biomart.tsv"
biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/zebrafish_biomart.tsv"
output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_human_zebrafish.tsv"

/usr/bin/time -v ./1_1alignment.py --blast1 $blast1 --blast2 $blast2 --biomart1 $biomart1 --biomart2 $biomart2 -o $output