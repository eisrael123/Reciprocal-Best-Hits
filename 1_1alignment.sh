#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --nodes=1
#SBATCH --output=output_%j.log   # STDOUT
#SBATCH --error=error_%j.log     # STDERR
set -e 

## MY TEST 
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_file_1.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_file_2.txt"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_output.tsv"

##JOSH TEST
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_files_josh/a_blastp.tsv"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_files_josh/b_blastp.tsv"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_files_josh/a_biomart.txt"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/test_files_josh/b_biomart.txt"
# output="test_output.tsv"

##HUMAN ZEBRAFISH
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_human_against_zfish.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_zfish_against_human.txt"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/hsa_114_biomart.tsv"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/dre_114_biomart.tsv"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_human_zebrafish.tsv"

##HUMAN EEL 
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_human_against_eel.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_eel_against_human.txt"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/hsa_114_biomart.tsv"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/eel_114_biomart.tsv"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_human_eel.tsv"

##HUMAN BABYWHALE
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_human_against_babywhale.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_babywhale_against_human.txt"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/hsa_114_biomart.tsv"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/pka_114_biomart.tsv"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_human_babywhale.tsv"

##ZEBRAFISH EEL 
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_zfish_against_eel.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_eel_against_zfish.txt"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/dre_114_biomart.tsv"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/eel_114_biomart.tsv"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_zfish_eel.tsv"

##ZEBRAFISH BABYWHALE
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_zfish_against_babywhale.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_babywhale_against_zfish.txt"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/dre_114_biomart.tsv"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/pka_114_biomart.tsv"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_zfish_babywhale.tsv"

#EEL BABYWHALE
# blast1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_eel_against_babywhale.txt"
# blast2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/sorted_babywhale_against_eel.txt"
# biomart1="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/eel_114_biomart.tsv"
# biomart2="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/biomart/pka_114_biomart.tsv"
# output="/projects/bgmp/ewi/bioinfo/Bi623/Assignments/Reciprocal-Best-Hits/1to1_eel_babywhale.tsv"


#/usr/bin/time -v ./1_1alignment.py --blast1 $blast1 --blast2 $blast2 --biomart1 $biomart1 --biomart2 $biomart2 -o $output
./1_1alignment.py --blast1 $blast1 --blast2 $blast2 --biomart1 $biomart1 --biomart2 $biomart2 -o $output