dataset_path<-file.choose()  
# This will open a file dialog for selecting the file 01_Dataset to update both PD and Control datasets
source(dataset_path)
rm(dataset_path)

#HTT genotype frequencies----

Table<-TABLE(DATASET,"PATOLOGIA","CODIGO.HTT","PD vs control frequencies HTT")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#IAs frequencies
Matriz<-Table[,-3]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#Expanded frequencies
Matriz<-Table[,-2]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#Cancer frequencies
Table<-TABLE(PI,"CANCER","CODIGO.HTT","HTT vs cancer in iPD")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Matriz<-Table[,-3]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Matriz<-Table[,-2]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#ATXN1 genotype frequencies----

Table<-TABLE(DATASET,"PATOLOGIA","CODIGO.SCA1","PD vs control frequencies ATXN1")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#IAs frequencies
Matriz<-Table[,-3]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#Expanded frequencies
Matriz<-Table[,-2]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#Cancer frequencies
Table<-TABLE(PI,"CANCER","CODIGO.SCA1","ATXN1 vs cancer in iPD")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Matriz<-Table[,-3]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Matriz<-Table[,-2]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#ATXN2 genotype frequencies----

Table<-TABLE(DATASET,"PATOLOGIA","CODIGO.SCA2","PD vs control frequencies ATXN2")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#IAs frequencies
Matriz<-Table[,-3]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#Expanded frequencies
Matriz<-Table[,-2]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

#Cancer frequencies
Table<-TABLE(PI,"CANCER","CODIGO.SCA2","ATXN2 vs cancer in iPD")
rowPercents(Table)
my_function(Table)
pairwise_fisher_test(Table, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Matriz<-Table[,-3]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)

Matriz<-Table[,-2]
pairwise_fisher_test(Matriz, p.adjust.method="holm",conf.int = TRUE, detailed = T)
