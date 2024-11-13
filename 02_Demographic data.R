dataset_path<-file.choose()  
# This will open a file dialog for selecting the file 01_Dataset to update both PD and Control datasets
source(dataset_path)
rm(dataset_path)

#Age at onset in PD cohort----
mean(na.omit(PI$EDAD.INICIO))
sd(na.omit(PI$EDAD.INICIO))

mean_sd(PI, "CANCER", "EDAD.INICIO", "Age at onset PD")
wilcox.test(EDAD.INICIO ~ CANCER, data = PI, conf.int=TRUE)

mean_sd(PI, "CANCER.A.D.", "EDAD.INICIO", "Age at onset PD")
dunn<-dunnTest(PI$EDAD.INICIO~PI$CANCER.A.D.,
               method = "holm")

print(dunn,dunn.test.results=T)

#Age at death/ last visit----

mean_sd(DATASET, "PATOLOGIA", "EDAD.MUERTE", "Age at death/ last visit PD")
wilcox.test(EDAD.MUERTE ~ PATOLOGIA, data = DATASET)

mean_sd(PI, "CANCER", "EDAD.MUERTE", "Age at death/ last visit PD")
wilcox.test(EDAD.MUERTE ~ CANCER, data = PI)

mean_sd(PI, "CANCER.A.D.", "EDAD.MUERTE", "Age at death/ last visit PD")
dunn<-dunnTest(PI$EDAD.MUERTE~PI$CANCER.A.D.,
               method = "holm")

print(dunn,dunn.test.results=T)

#Disease duration----

mean(na.omit(PI$DURACION))
sd(na.omit(PI$DURACION))

mean_sd(PI, "CANCER", "DURACION", "Disease duration")
wilcox.test(DURACION ~ CANCER, data = PI)

mean_sd(PI, "CANCER.A.D.", "DURACION", "Disease duration")
kruskal.test(DURACION ~ CANCER, data = PI)
dunn<-dunnTest(PI$DURACION~PI$CANCER.A.D.,
               method = "holm")

print(dunn,dunn.test.results=T)

#Sex distribution----
Table<-TABLE(DATASET,"PATOLOGIA","SEXO","Sex distribution in PD and control cohorts")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Table<-TABLE(PI,"CANCER","SEXO","Sex distribution on cancer data")
rowPercents(Table)
my_function(Table)

#Smoke & drink data----
Table<-TABLE(DATASET,"PATOLOGIA","BEBEDOR","Drinking data in PD and control cohorts")
rowPercents(Table)
my_function(Table)

Table<-TABLE(PI,"CANCER","BEBEDOR","Drinking data  on cancer data")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Table<-TABLE(DATASET,"PATOLOGIA","FUMADOR","Smoking data in PD and control cohorts")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Table<-TABLE(PI,"CANCER","FUMADOR","Smoking data  on cancer data")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)