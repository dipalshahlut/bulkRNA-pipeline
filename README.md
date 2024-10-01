### bulkRNA-pipeline
## To study the effect of sodium fluoroacetate treatment and (i) alterations in HIF1a pathway genes, and (ii) Glycolysis genes.

1. download SRR file
a. https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR25915983&display=download
b. https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR25915982&display=download
c. https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR25915985&display=download
d. https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR25915984&display=download

# Process singleScript_final.sh file
2. download and process sequencing data from NCBI  using SRA toolkit
a) uncomment step 1 in the .sh file
b) on command line upload require modules
module load SRA-Toolkit/2.10.7-centos_linux64
module load FastQC/0.11.9-Java-11
module load Trimmomatic/0.36-Java-1.8.0_92 

4. convert fastq files to count matrix  ---- check for align reads using HISAT2 package
a) uncomment step 1 in the .sh file
b) on command line upload require modules
java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.36.jar
module load zlib/1.2.8-foss-2016b
module load HISAT2/2.1.0-foss-2016b
module load BCFtools
module load HTSeq/0.6.1p1-intel-2015b-Python-2.7.8
module load zlib/1.2.8-foss-2016b
module load Pysam/0.9.1.4-foss-2016a-Python-2.7.12
module load Pysam/0.9.1.4-foss-2016b-Python-2.7.12
module load kallisto/0.43.1-intel-2017a

5. https://daehwankimlab.github.io/hisat2/download/#h-sapiens ----->for graph-based alignment of next generation sequencing reads to a population of genomes
 
6. https://useast.ensembl.org/index.html  -----> for ensemble human genome gene annotation

# Process testFile.ipynb for further process, evaluate differential gene analysis
