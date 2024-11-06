# Datasets description
These datasets include various clinical and demographic variables for subjects with idiopathic Parkinson's disease (iPD) and Controls, as well as genetic markers and lifestyle factors, structured as follows:

## Demographic Variables:

Sex: 1 = Male, 2 = Female

Age at last visit or death

Age at disease onset (only for iPD)

Disease duration: calculated from onset to last visit or death (only for iPD)

Survival Status: 
0 = Censored (alive at last follow-up), 1 = Deceased

Cancer Data:
Cancer presence: 1 = Yes, 2 = No

Timing of cancer in relation to PD onset: 1 = Cancer before PD, 2 = Cancer after PD

Cancer Location Codes:
1 = Haematologic, 2 = Digestive, 3 = Melanoma, 4 = Uterus/Ovary, 5 = Breast, 6 = Prostate, 7 = Lung, 8 = Thyroid, 9 = Other, 10 = Bladder
Lifestyle Factors:

Smoking status:
1 = Smoker (>10 cigarettes/day)
2 = Non-smoker
3 = Former smoker

Drinking status:
1 = Drinker (women >40g/day, men >60g/day of ethanol)
2 = Non-drinker

## Genetic Markers:
Understood. Here’s how the genetic data structure and allele classification would look with **ALLELE.1** representing the shorter allele and **ALLELE.2** the longer allele:

1. **HTT Gene**:
   - **ALLELE.1**(`ALELO.1`): Shorter allele of the HTT gene.
   - **ALLELE.2**(`ALELO.2`): Longer allele of the HTT gene.
   - **HTT CODE** (`CODIGO.HTT`): Classification code for the HTT alleles.
     - `0` = Normal
     - `1` = Intermediate Allele (IA)
     - `2` = Expanded Allele

2. **SCA1 Gene**:
   - **ALLELE1.SCA1**(`ALELO1.SCA1`): Shorter allele of the SCA1 gene.
   - **ALLELE2.SCA1**(`ALELO2.SCA1`): Longer allele of the SCA1 gene.
   - **SCA1 CODE** (`CODIGO.SCA1`): Classification code for the SCA1 alleles.
     - `0` = Normal
     - `1` = Intermediate Allele (IA)
     - `2` = Expanded Allele

3. **SCA2 Gene**:
   - **ALLELE1.SCA2**(`ALELO1.SCA2`): Shorter allele of the SCA2 gene.
   - **ALLELE2.SCA2**(`ALELO2.SCA2`): Longer allele of the SCA2 gene.
   - **SCA2 CODE** (`CODIGO.SCA2`): Classification code for the SCA2 alleles.
     - `0` = Normal
     - `1` = Intermediate Allele (IA)
     - `2` = Expanded Allele

This allows a clear distinction between the alleles based on length, where **ALLELE.1** is always the shorter of the two and **ALLELE.2** the longer. The classification codes for normal, intermediate, and expanded alleles remain consistent across all genes.

This structure provides a comprehensive overview of each subject's demographic, clinical, lifestyle, and genetic data for in-depth analysis of factors associated with idiopathic Parkinson's disease (iPD).
