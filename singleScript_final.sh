#!/bin/bash

SECONDS=0

#export PATH=/home/rsharma3/DrAftab/Dr_Aftab/samtools-1.17/:$PATH
#export PATH=/home/rsharma3/DrAftab/Dr_Aftab/subread-2.0.6-Linux-x86_64/bin/:$PATH

#WORKING DIRECTORY
cd /home/rsharma3/DrAftab/Dr_Aftab/FastqData

# Define the directory containing FASTQ files
FASTQ_DIR="/home/rsharma3/DrAftab/Dr_Aftab/FastqData/"

# Define the output directory for FastQC results
OUTPUT_DIR="/home/rsharma3/DrAftab/Dr_Aftab/Output"
HISAT_DIR="/home/rsharma3/DrAftab/Dr_Aftab/FastqData/Hisat"
FINAL_OUTPUT="/home/rsharma3/DrAftab/Dr_Aftab/FastqData/TxtOutput"
# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"
mkdir -p "$HISAT_DIR"
mkdir -p "$FINAL_OUTPUT"


# Load FastQC module if needed (uncomment if you are on a system with environment modules)
# module load fastqc

#module load FastQC/0.11.9-Java-11

## STEP 1: Run fastqc
#fastqc SRR25915982_1.fastq -o Data/
#echo "fastqc finished running!"

## run trimmomatic to trim reads with poor quality
##module load Trimmomatic/0.36-Java-1.8.0_92 
#java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.36.jar SE -threads 4 SRR25915982_1.fastq Data/SRR25915982_1_trimmed.fastq TRAILING:10 -phred33
## "$trimmed_file" TRAILING:10 -phred33
#echo "Trimmomatic finished running!"

#fastqc Data/SRR25915982_1_trimmed.fastq -o Data/

# STEP 2: Run HISAT2
# mkdir Hisat
# get the genome indices
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz


#module load zlib/1.2.8-foss-2016b
#module load HISAT2/2.1.0-foss-2016b
#module load Pysam/0.9.1.4-foss-2016b-Python-2.7.12


# run alignment
#hisat2 -q --rna-strandness R -x Hisat/grch38/genome -U Data/SRR25915982_1_trimmed.fastq | samtools sort -o Hisat/SRR25915982_1_trimmed.bam
hisat2 -q --rna-strandness R -x Hisat/grch38/genome -U /home/rsharma/DrAftab/Dr_Aftab/FastqData/Data/SRR25915982_1_trimmed.fastq | samtools sort -o \/home/rsharma3/DrAftab/Dr_Aftab/FastqData/Hisat/SRR25915982_1_trimmed.bam


echo "HISAT2 finished running!"

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

echo "HTSeq finished running!"


