# PD_cancer
Complete statistics necessary to understand the results presented in the article entitled: "HTT, ATXN1 and ATXN2 CAG triplet repeat sizes: exploring their role in the disease risk and cancer comorbidity in Parkinson’s disease."

## Datasets Folder

This folder contains a series of R scripts used for data processing, analysis, and statistical modelling in the current study. Each file has a specific purpose related to the preparation and analysis of demographic and genetic data. Below is an outline of the contents:

**[01_Datasets.R](./01_Datasets.R)**: This script loads and structures the primary datasets used in the study. 
  NOTE: This will be run every time you run another script, to select the datasets.
**[02_Demographic data.R](./02_Demographic%20data.R)**: Contains code to analyse and summarise demographic data, such as age and gender distributions.  
**[03_Genotype frequencies.R](./03_Genotype%20frequencies.R)**: Calculates genotype frequencies for the specified genetic variants within the dataset.  
**[04_CAG repeat sizes.R](./04_CAG%20repeat%20sizes.R)**: Analyses CAG repeat sizes, including size effects.  
**[05_Regression models.R](./05_Regression%20models.R)**: Implements various regression models to assess associations between genetic and clinical variables.  

These scripts are intended to provide a reproducible workflow for analysing demographic and genetic data relevant to the research.
