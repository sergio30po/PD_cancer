# Statistical analyYess of frequencies and correlations within a cohort with idiopathic Parkinson’s disease (iPD)

packages = c("pwr", "rcompanion", "FSA", "installr", "xlsx", "dplyr", "readxl", "ggplot2", "corrplot", "devtools", "ggpubr", "lsr", "Rcmdr", "survival", "KMsurv", "survMisc", "survminer", "ggfortify", "flexsurv", "actuar", "nortest", "rstatix", "gtsummary", "car", "DataExplorer","readxl")
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

#Mean & sd function----

mean_sd <- function(cohort, category, numeric_var, result_name) {
  
  # Get the complete list of categories in the dataframe
  categories <- unique(cohort[[category]])
  
  # Create an empty dataframe to store the results
  results <- data.frame(CATEGORY = character(),
                        MEAN = numeric(),
                        STANDARD_DEVIATION = numeric(),
                        stringsAsFactors = FALSE)
  
  # Calculate the mean and standard deviation for each category
  for (c in categories) {
    mean_value <- mean(na.omit(cohort[[numeric_var]][cohort[[category]] == c]))
    sd_value <- sd(na.omit(cohort[[numeric_var]][cohort[[category]] == c]))
    
    # Add the results to the dataframe
    results[nrow(results) + 1,] <- list(c, round(mean_value, 2), round(sd_value, 2))
  }
  
  # Rename the columns of the results dataframe
  colnames(results) <- c(category, paste(result_name, "MEAN"), paste(result_name, "SD"))
  
  # Return the dataframe with the results
  return(results)
}

#Chi-sq & fisher test function----

my_function <- function(matrix) {
  # Perform chi-square test
  chi_test <- chisq.test(matrix, correct=FALSE)
  
  # Check if more than 20% of expected values are less than 5
  perc_expected <- sum(chi_test$expected < 5) / length(chi_test$expected)
  if (perc_expected > 0.2) {
    # Perform Fisher's exact test
    fisher_test <- fisher.test(matrix)
    test_result <- fisher_test$p.value
  } else {
    test_result <- chi_test$p.value
  }
  
  # Perform multiple comparisons
  comparison <- pairwiseNominalIndependence(matrix,
                                            fisher = TRUE,
                                            gtest  = FALSE,
                                            chisq  = TRUE,
                                            method = "holm")
  
  # Print results
  print("Multiple comparisons:")
  print(comparison)
  if (perc_expected > 0.2) {
    print("Fisher's test results:")
    print(fisher_test)
  } else {
    print("Chi-square test results:")
    print(chi_test)
  }
}

#Table function for percentages and frequencies-----

TABLE <- function(data, variable1, variable2, tableName) {
  Table <- xtabs(formula = as.formula(paste0("~", variable1, "+", variable2)), data = data)
  cat(paste0("\nFrequency table: ", tableName, "\n"))
  Table <- as.matrix(Table)
  rownames(Table) <- levels(data[[variable1]])
  colnames(Table) <- levels(data[[variable2]])
  Table[is.nan(Table)] <- 0
  print(Table)
}

#Datasets-----

# Select and load PI dataset
cat("Choose PD dataset:\n")
ruta_PI <- file.choose()  # This will open a file dialog for selecting the file
PI <- read_excel(ruta_PI)
PI <- PI[-1,]
rm(ruta_PI)

# Select and load CONTROL dataset
cat("Choose Control dataset:\n")
ruta_CONTROL <- file.choose()  # This will open a file dialog for selecting the file
CONTROL <- read_excel(ruta_CONTROL)
CONTROL <- CONTROL[-1,]
rm(ruta_CONTROL)

#Categorical variables-----
PI$SEXO<- factor(PI$SEXO,labels=c("Male","Female"))
PI$CODIGO.HTT<- factor(PI$CODIGO.HTT,labels=c("Normal","IA","Expanded"))
PI$CODIGO.APOE<- factor(PI$CODIGO.APOE,labels=c("e4-","e4+"))
PI$CODIGO.SCA1<- factor(PI$CODIGO.SCA1,labels=c("Normal","IA","Expanded"))
PI$CODIGO.SCA2<- factor(PI$CODIGO.SCA2,labels=c("Normal","IA","Expanded"))
PI$SUPERVIVENCIA<- factor(PI$SUPERVIVENCIA,labels=c("censored","exitus"))
PI$CANCER<- factor(PI$CANCER,labels=c("Yes","No"))
PI$CANCER.A.D.<- factor(PI$CANCER.A.D.,labels=c("Before PD","After PD","No"))
PI$FUMADOR<- factor(PI$FUMADOR,labels=c("Yes","No","EX"))
PI$BEBEDOR<- factor(PI$BEBEDOR,labels=c("Yes","No"))
PI$PATOLOGIA<- factor(PI$PATOLOGIA,labels=c("iPD"))

CONTROL$SEXO<- factor(CONTROL$SEXO,labels=c("Male","Female"))
CONTROL$CANCER<- factor(CONTROL$CANCER,labels=c("Controls"))
CONTROL$CODIGO.HTT<- factor(CONTROL$CODIGO.HTT,labels=c("Normal","IA","Expanded"))
CONTROL$CODIGO.SCA1<- factor(CONTROL$CODIGO.SCA1,labels=c("Normal","IA"))
CONTROL$CODIGO.SCA2<- factor(CONTROL$CODIGO.SCA2,labels=c("Normal","IA"))
CONTROL$CODIGO.APOE<- factor(CONTROL$CODIGO.APOE,labels=c("e4-","e4+"))
CONTROL$FUMADOR<- factor(CONTROL$FUMADOR,labels=c("Yes","No"))
CONTROL$PATOLOGIA<- factor(CONTROL$PATOLOGIA,labels=c("Controls"))

#Numeric variables-----

PI$EDAD.MUERTE<- as.numeric(PI$EDAD.MUERTE)
PI$EDAD.INICIO<- as.numeric(PI$EDAD.INICIO)
PI$DURACION<- as.numeric(PI$DURACION)
PI$ALELO.1<- as.numeric(PI$ALELO.1)
PI$ALELO.2<- as.numeric(PI$ALELO.2)
PI$ALELO1.SCA1<- as.numeric(PI$ALELO1.SCA1)
PI$ALELO2.SCA1<- as.numeric(PI$ALELO2.SCA1)
PI$ALELO1.SCA2<- as.numeric(PI$ALELO1.SCA2)
PI$ALELO2.SCA2<- as.numeric(PI$ALELO2.SCA2)

CONTROL$EDAD.MUERTE<- as.numeric(CONTROL$EDAD.MUERTE)
CONTROL$ALELO.1<- as.numeric(CONTROL$ALELO.1)
CONTROL$ALELO.2<- as.numeric(CONTROL$ALELO.2)
CONTROL$ALELO1.SCA1<- as.numeric(CONTROL$ALELO1.SCA1)
CONTROL$ALELO2.SCA1<- as.numeric(CONTROL$ALELO2.SCA1)
CONTROL$ALELO1.SCA2<- as.numeric(CONTROL$ALELO1.SCA2)
CONTROL$ALELO2.SCA2<- as.numeric(CONTROL$ALELO2.SCA2)
# Combine the two datasets
DATASET <- rbind.data.frame(select(PI,-Localizacion,-Codigo.localizacion), CONTROL)


# Cancer datasets----

CANCER.PI<-subset(PI,PI$CANCER!="No")
NoCANCER.PI<-subset(PI,PI$CANCER=="No")
NoCANCER.PI<-select(NoCANCER.PI,-CANCER)
table(PI$CANCER)

table(PI$CANCER.A.D.)
prop.table(table(PI$CANCER.A.D.))
table(CANCER.PI$CANCER.A.D.)
prop.table(table(CANCER.PI$CANCER.A.D.))