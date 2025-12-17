# Reciprocal Best Hits (RBH) Identification

## Overview
This repository contains tools and scripts to identify **orthologous genes** across species by determining **1:1 Reciprocal Best Hits (RBH)**. The reciprocal best hit criterion is a common computational method used in comparative genomics to infer orthology. Two genes, $A$ (from species 1) and $B$ (from species 2), are considered reciprocal best hits if:
1. Gene $A$'s best hit in species 2 is Gene $B$.
2. Gene $B$'s best hit in species 1 is Gene $A$.

This project provides the pipeline to perform these alignments and filter for 1:1 orthologs.

## Repository Structure
The repository is organized as follows:

- **`1_1alignment.py`**: The main Python script that implements the logic for identifying 1:1 reciprocal best hits from alignment data.
- **`1_1alignment.sh`**: A shell script, likely used to automate the execution of the Python script or handle the BLAST processing pipeline.
- **`reciprocal_best_hits/`**: Directory containing output or module code specific to the RBH logic.
- **`pseudocode.txt`**: A text file outlining the algorithmic logic and steps taken to achieve the RBH results. See this file for a high-level understanding of the code's approach.
- **`test_files/`**: Contains sample data to test the pipeline.
- **`Assignment1_answers.Rmd`** & **`lab notebook assignment 1.pdf`**: Documentation and reports associated with the development of this project.

## Requirements
To use the tools in this repository, you will likely need the following software installed:

* **Python 3.x**: For running the main analysis script (`1_1alignment.py`).
* **NCBI BLAST+**: For generating the initial sequence alignments (blastp/blastn) required for RBH analysis.
* **Unix/Linux Environment**: For running the shell scripts (`.sh`).

## Usage

### 1. Clone the Repository
```bash
git clone [https://github.com/eisrael123/Reciprocal-Best-Hits.git](https://github.com/eisrael123/Reciprocal-Best-Hits.git)
cd Reciprocal-Best-Hits
