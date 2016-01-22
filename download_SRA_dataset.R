####
# Install necessary package from bioconductor
# source("https://bioconductor.org/biocLite.R")
# biocLite("SRAdb")
# Instruction from Bioconductor SRAdb manual

library(SRAdb)

sqlfile <- 'SRAmetadb.sqlite' # Initialize variable with database
if(!file.exists('SRAmetadb.sqlite')) sqlfile <<- getSRAdbFile() # Download SQL database with complete SRA, env. 1.1 Gb
# file.info('SRAmetadb.sqlite')  # Display file information

sra_con <- dbConnect(SQLite(),sqlfile) # Create connection to database

# SRA for Patel AP, Tirosh I, Trombetta JJ, Shalek AK et al. Single-cell RNA-seq highlights intratumoral heterogeneity in primary glioblastoma.
getSRAinfo(c("SRP042161"), sra_con, sraType="sra") # Long

####
# Test subsample
SRA_match <- getSRAinfo(c("SRX549977"), sra_con, sraType="sra") # Extract sample information (experiment, study, sample, run, size, date)
# getFASTQinfo(SRA_match$run, sra_con, srcType='ftp') # Display fasta information
getSRAfile(SRA_match$run, sra_con, fileType='fastq') # Download fasta files il local directory, env. 1,3 Gb : 2 x 633 Mb
