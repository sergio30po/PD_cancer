dataset_path<-file.choose()  
# This will open a file dialog for selecting the file 01_Dataset to update both PD and Control datasets
source(dataset_path)
rm(dataset_path)

## HTT----

### Long allele

mean_sd(DATASET, "PATOLOGIA", "ALELO.2", "HTT long allele")
wilcox.test(ALELO.2 ~ PATOLOGIA, data = DATASET)
cohensD(PI$ALELO.2, CONTROL$ALELO.2)

  #### Cancer data

mean_sd(PI, "CANCER","ALELO.2","HTT long allele")
wilcox.test(ALELO.2 ~ CANCER, data = PI)
cohensD(CANCER.PI$ALELO.2,NOCANCER.PI$ALELO.2)

### Short allele

mean_sd(DATASET, "PATOLOGIA", "ALELO.1", "HTT short allele")
wilcox.test(ALELO.1 ~ PATOLOGIA, data = DATASET)
cohensD(PI$ALELO.1, CONTROL$ALELO.1)

  #### Cancer data

mean_sd(PI, "CANCER","ALELO.1","HTT short allele")
wilcox.test(ALELO.1 ~ CANCER, data = PI)
cohensD(CANCER.PI$ALELO.1,NOCANCER.PI$ALELO.1)

## SCA1-----

### Long allele ATXN1

mean_sd(DATASET, "PATOLOGIA", "ALELO2.SCA1", "ALELO2.SCA1")
wilcox.test(ALELO2.SCA1 ~ PATOLOGIA, data = DATASET)
cohensD(PI$ALELO2.SCA1, CONTROL$ALELO2.SCA1)

#### Cancer data

mean_sd(PI, "CANCER","ALELO2.SCA1","ALELO2.SCA1")
wilcox.test(ALELO2.SCA1 ~ CANCER, data = PI)
cohensD(CANCER.PI$ALELO2.SCA1,NOCANCER.PI$ALELO2.SCA1)

### Short allele ATXN1

mean_sd(DATASET, "PATOLOGIA", "ALELO1.SCA1", "ALELO1.SCA1")
wilcox.test(ALELO1.SCA1 ~ PATOLOGIA, data = DATASET)
cohensD(PI$ALELO1.SCA1, CONTROL$ALELO1.SCA1)

#### Cancer data

mean_sd(PI, "CANCER","ALELO1.SCA1","ALELO1.SCA1")
wilcox.test(ALELO1.SCA1 ~ CANCER, data = PI)
cohensD(CANCER.PI$ALELO1.SCA1,NOCANCER.PI$ALELO1.SCA1)

## SCA2-----

### Long allele ATXN2

mean_sd(DATASET, "PATOLOGIA", "ALELO2.SCA2", "ALELO2.SCA2")
wilcox.test(ALELO2.SCA2 ~ PATOLOGIA, data = DATASET)
cohensD(PI$ALELO2.SCA2, CONTROL$ALELO2.SCA2)

#### Cancer data

mean_sd(PI, "CANCER","ALELO2.SCA2","ALELO2.SCA2")
wilcox.test(ALELO2.SCA2 ~ CANCER, data = PI)
cohensD(CANCER.PI$ALELO2.SCA2,NOCANCER.PI$ALELO2.SCA2)

### Short allele ATXN2

mean_sd(DATASET, "PATOLOGIA", "ALELO1.SCA2", "ALELO1.SCA2")
wilcox.test(ALELO1.SCA2 ~ PATOLOGIA, data = DATASET)
cohensD(PI$ALELO1.SCA2, CONTROL$ALELO1.SCA2)

#### Cancer data

mean_sd(PI, "CANCER","ALELO1.SCA2","ALELO1.SCA2")
wilcox.test(ALELO1.SCA2 ~ CANCER, data = PI)
cohensD(CANCER.PI$ALELO1.SCA2,NOCANCER.PI$ALELO1.SCA2)
