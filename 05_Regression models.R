dataset_path<-file.choose()  
# This will open a file dialog for selecting the file 01_Dataset to update both PD and Control datasets
source(dataset_path)
rm(dataset_path)

install.packages("lmtest")
library(lmtest)
install.packages("pROC")
library(pROC)

##PD risk (binomial)----
DATASETLM<-select(DATASET,-EDAD.INICIO,-EDAD.MUERTE,-DURACION,-SUPERVIVENCIA) 
model <- glm(PATOLOGIA ~ CODIGO.HTT+ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2+CODIGO.SCA1 + ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1+CODIGO.SCA2 + ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = DATASETLM, family = binomial)
summary(model)
step(object = model, direction = "backward", trace = 0)
mod<-glm(formula = PATOLOGIA ~  ALELO.1 + I(ALELO.1^2) + ALELO.2 + 
              ALELO1.SCA1 + ALELO2.SCA1 + I(ALELO2.SCA1^2) + CODIGO.SCA2 + 
              ALELO1.SCA2 + I(ALELO1.SCA2^2) + ALELO2.SCA2 + I(ALELO2.SCA2^2) + 
              ALELO.1:ALELO.2 + ALELO1.SCA2:ALELO2.SCA2, family = binomial, 
            data = DATASETLM)
summary(mod)
lrtest(mod)
confint(mod)
exp(coef(mod))

#HTT PD risk model----
DATASETLM <- DATASET %>%
  filter(!is.na(ALELO.1)) %>%
  filter(!is.na(ALELO.2))
model <- glm(PATOLOGIA ~ ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2, data = DATASETLM, family = binomial)
summary(model)
step(object = model, direction = "backward", trace = 0)
mod<-glm(formula = PATOLOGIA ~  ALELO.2 + I(ALELO.2^2), family = binomial, 
         data = DATASETLM)
summary(mod)
lrtest(mod)
confint(mod)
exp(coef(mod))

#Sex distribution
# Male dataset
modelo_Male <- glm(PATOLOGIA ~ ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2, data = filter(DATASETLM, SEXO == "Male"), family = binomial())
summary(modelo_Male)
step(object = modelo_Male, direction = "backward", trace = 0)
mod<-glm(PATOLOGIA ~ ALELO.1 + I(ALELO.1^2) + 
           ALELO.2 + I(ALELO.2^2), data = filter(DATASETLM, SEXO == "Male"), family = binomial())
summary(mod)
confint(mod)
exp(coef(mod))

# Female dataset
modelo_Female <- glm(PATOLOGIA ~ ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2, data = filter(DATASETLM, SEXO == "Female"), family = binomial())
summary(modelo_Female)
step(object = modelo_Female, direction = "backward", trace = 0)
mod<-glm(PATOLOGIA ~ ALELO.2 + I(ALELO.2^2), family = binomial(), 
         data = filter(DATASETLM, SEXO == "Female"))
summary(mod)
confint(mod)
exp(coef(mod))

#ATXN1 PD risk model----
DATASETLM <- DATASET %>%
  filter(!is.na(ALELO1.SCA1)) %>%
  filter(!is.na(ALELO2.SCA1))
model <- glm(PATOLOGIA ~ ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data = DATASETLM, family = binomial)
summary(model)
step(object = model, direction = "backward", trace = 0)
mod<-glm(formula = PATOLOGIA ~ ALELO1.SCA1 + I(ALELO1.SCA1^2) + 
           ALELO2.SCA1 + ALELO1.SCA1:ALELO2.SCA1, family = binomial, 
         data = DATASETLM)
summary(mod)
lrtest(mod)
confint(mod)
exp(coef(mod))

#Sex distribution
# Male dataset
modelo_Male <- glm(PATOLOGIA ~  ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data = filter(DATASETLM, SEXO == "Male"), family = binomial())
summary(modelo_Male)
step(object = modelo_Male, direction = "backward", trace = 0)
mod<-glm(PATOLOGIA ~ ALELO1.SCA1 + ALELO2.SCA1 + ALELO1.SCA1:ALELO2.SCA1, data = filter(DATASETLM, SEXO == "Male"), family = binomial())
summary(mod)
confint(mod)
exp(coef(mod))

# Female dataset
modelo_Female <- glm(PATOLOGIA ~  ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data = filter(DATASETLM, SEXO == "Female"), family = binomial())
summary(modelo_Female)
step(object = modelo_Female, direction = "backward", trace = 0)
mod<-glm(PATOLOGIA ~I(ALELO1.SCA1^2) + I(ALELO2.SCA1^2), family = binomial(), 
         data = filter(DATASETLM, SEXO == "Female"))
summary(mod)
confint(mod)
exp(coef(mod))

#ATXN2 PD risk model----

DATASETLM <- DATASET %>%
  filter(!is.na(ALELO1.SCA2)) %>%
  filter(!is.na(ALELO2.SCA2))
model <- glm(PATOLOGIA ~ ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = DATASETLM, family = binomial)
summary(model)
step(object = model, direction = "backward", trace = 0)
mod<-glm(formula = PATOLOGIA ~ALELO1.SCA2 + I(ALELO1.SCA2^2) + 
           ALELO2.SCA2 + ALELO1.SCA2:ALELO2.SCA2, family = binomial, 
         data = DATASETLM)
summary(mod)
lrtest(mod)
confint(mod)
exp(coef(mod))
#Sex distribution
# Male dataset
modelo_Male <- glm(PATOLOGIA ~  ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = filter(DATASETLM, SEXO == "Male"), family = binomial())
summary(modelo_Male)
step(object = modelo_Male, direction = "backward", trace = 0)
mod<-glm(PATOLOGIA ~ALELO1.SCA2 + I(ALELO1.SCA2^2) + 
           ALELO2.SCA2 + ALELO1.SCA2:ALELO2.SCA2, data = filter(DATASETLM, SEXO == "Male"), family = binomial())
summary(mod)
confint(mod)
exp(coef(mod))
#Female dataset
modelo_Female <- glm(PATOLOGIA ~  ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = filter(DATASETLM, SEXO == "Female"), family = binomial())
summary(modelo_Female)
step(object = modelo_Female, direction = "backward", trace = 0)
mod<-glm(PATOLOGIA ~ ALELO1.SCA2 + I(ALELO1.SCA2^2), family = binomial(), 
         data = filter(DATASETLM, SEXO == "Female"))
summary(mod)
confint(mod)
exp(coef(mod))


##Cancer risk (binomial)----

PARKLM<-select(PI,SEXO,CANCER,FUMADOR,BEBEDOR,ALELO.1,ALELO.2,CODIGO.HTT,ALELO1.SCA1,ALELO2.SCA1,CODIGO.SCA1,ALELO1.SCA2,ALELO2.SCA2,CODIGO.SCA2) 
modelo<-glm(CANCER ~., data=na.omit(PARKLM), family=binomial())
summary(modelo)
step(object = modelo, direction = "backward", trace = 0)
modelo<-glm(CANCER ~BEBEDOR + ALELO1.SCA1 + ALELO1.SCA2, data=PARKLM, family=binomial())
summary(modelo)
confint(modelo)
exp(coef(modelo))

#Quadratic model
mod<-glm(CANCER ~ CODIGO.HTT+ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2+CODIGO.SCA1 + ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1+CODIGO.SCA2 + ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = na.omit(PARKLM), family = binomial)
summary(mod)
step(object = mod, direction = "backward", trace = 0)
mod2<-glm(formula = CANCER ~ ALELO.1 + I(ALELO.1^2) + ALELO1.SCA2, family = binomial, data = PARKLM)
summary(mod2)
confint(mod2)
exp(coef(mod2))

#HTT Cancer risk model----
PARKLM<-PI %>%
  filter(!is.na(ALELO.1)) %>%
  filter(!is.na(ALELO.2))
modelo<-glm(CANCER ~CODIGO.HTT + ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2, data=PARKLM, family=binomial())
summary(modelo)
step(object = modelo, direction = "backward", trace = 0)

#Sex distribution
# Male dataset
modelo_Male <- glm(CANCER ~ CODIGO.HTT+ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2, data = filter(PARKLM, SEXO == "Male"), family = binomial())
summary(modelo_Male)
step(object = modelo_Male, direction = "backward", trace = 0)

# Female dataset
modelo_Female <- glm(CANCER ~ CODIGO.HTT +  ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2 , data = filter(PARKLM, SEXO == "Female"), family = binomial())
summary(modelo_Female)
step(object = modelo_Female, direction = "backward", trace = 0)
mod2<-glm(formula = CANCER ~ CODIGO.HTT+ALELO.2 + I(ALELO.2^2), family = binomial(), 
          data = filter(PARKLM, SEXO == "Female"))
summary(mod2)
anova(mod2, update(mod2, ~1), test="Chisq")
confint(mod2)
exp(coef(mod2))

#ATXN1 cancer risk model----
PARK_LM<-PI %>%
  filter(!is.na(ALELO1.SCA1)) %>%
  filter(!is.na(ALELO2.SCA1)) 
modelo<-glm(CANCER ~ ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data=PARK_LM, family=binomial())
summary(modelo)
step(object = modelo, direction = "backward", trace = 0)
modelo<-glm(CANCER ~  I(ALELO2.SCA1^2), data=PARK_LM, family=binomial())
summary(modelo)
anova(modelo, update(modelo, ~1), test="Chisq")
lrtest(modelo)
confint(modelo)
exp(coef(modelo))

#Sex distribution
# Male dataset
modelo_Male <- glm(CANCER ~ CODIGO.SCA1+ ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data = filter(PARK_LM, SEXO == "Male"), family = binomial())
summary(modelo_Male)
step(object = modelo_Male, direction = "backward", trace = 0)
mod<-glm(formula = CANCER ~  I(ALELO2.SCA1^2), family = binomial(), 
         data = filter(PARK_LM, SEXO == "Male"))
summary(mod)
anova(mod, update(mod, ~1), test="Chisq")
confint(mod)
exp(coef(mod))

# Female dataset
modelo_Female <- glm(CANCER ~ CODIGO.SCA1+ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data = filter(PARK_LM, SEXO == "Female"), family = binomial())
summary(modelo_Female)
step(object = modelo_Female, direction = "backward", trace = 0)
mod<-glm(formula = CANCER ~  ALELO2.SCA1 + I(ALELO2.SCA1^2), family = binomial(), 
         data = filter(PARK_LM, SEXO == "Female"))
summary(mod)
anova(mod, update(mod, ~1), test="Chisq")
confint(mod)
exp(coef(mod))
#ATXN2 cancer risk model----
PI_LM<-PI %>%
  filter(!is.na(ALELO1.SCA2)) %>%
  filter(!is.na(ALELO2.SCA2)) 

mod<-glm(CANCER ~CODIGO.SCA2 +ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data=PI_LM, family=binomial())
summary(mod)
step(object = mod, direction = "backward", trace = 0)
mod<-glm(CANCER ~ ALELO1.SCA2 + ALELO2.SCA2 + I(ALELO2.SCA2^2), data=PI_LM, family=binomial())
summary(mod)
anova(mod, update(mod, ~1), test="Chisq") #0.008559 
confint(mod)
exp(coef(mod))

#Sex distribution
# Male dataset
modelo_Male <- glm(CANCER ~ CODIGO.SCA2 +ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = filter(PI_LM, SEXO == "Male"), family = binomial())
summary(modelo_Male)
step(object = modelo_Male, direction = "backward", trace = 0)
mod<-glm(formula = CANCER ~ CODIGO.SCA2 + ALELO1.SCA2 + ALELO2.SCA2 + 
              I(ALELO2.SCA2^2), family = binomial(), 
            data = filter(PI_LM, SEXO == "Male"))
summary(mod)
confint(mod)
exp(coef(mod))

# Female dataset
modelo_Female <- glm(CANCER ~ CODIGO.SCA2 +ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data = filter(PI_LM, SEXO == "Female"), family = binomial())
summary(modelo_Female)
vif(modelo_Female)
step(object = modelo_Female, direction = "backward", trace = 0)




#Age of onset model----
#Complete model
PILM<-select(PI,-DURACION,-SUPERVIVENCIA,-EDAD.MUERTE,-PATOLOGIA,-HTT,-SCA1,-SCA2) 
mod<-lm(EDAD.INICIO ~., data=PILM)
summary(mod)
mod2<-lm(EDAD.INICIO ~., data=na.omit(PILM))
step(object = mod2, direction = "backward", trace = 0)
modAIC<-lm(EDAD.INICIO ~CANCER.A.D. + FUMADOR + ALELO.1 + 
             ALELO.2 + CODIGO.HTT + ALELO1.SCA1 + ALELO2.SCA1 + CODIGO.SCA2, data=PI)
summary(modAIC)

#STR model for age of onset
PILM<-select(PI,EDAD.INICIO,ALELO.1,ALELO.2,ALELO1.SCA1,ALELO2.SCA1,ALELO1.SCA2,ALELO2.SCA2) 
mod<-lm(EDAD.INICIO ~., data=PILM)
summary(mod)
mod2<-lm(EDAD.INICIO ~., data=na.omit(PILM))
step(object = mod2, direction = "backward", trace = 0)

#Quadratic terms STR model for age of onset
PILM<-select(PI,EDAD.INICIO,ALELO.1,ALELO.2,CODIGO.HTT,ALELO1.SCA1,ALELO2.SCA1,CODIGO.SCA1,ALELO1.SCA2,ALELO2.SCA2,CODIGO.SCA2) 
mod2<-lm(EDAD.INICIO ~CODIGO.HTT+ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2+CODIGO.SCA1 + ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1+CODIGO.SCA2 + ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data=na.omit(PILM))
summary(mod2)
step(object = mod2, direction = "backward", trace = 0)
mod2<-lm(EDAD.INICIO ~ALELO.1 + I(ALELO.1^2) + ALELO2.SCA2 + 
           I(ALELO2.SCA2^2), data=PILM)
summary(mod2)

#HTT age of onset model----
PILM<-select(PI,EDAD.INICIO,ALELO.1,ALELO.2,CODIGO.HTT) 
mod2<-lm(EDAD.INICIO ~CODIGO.HTT+ALELO.1+I(ALELO.1^2)+ALELO.2+I(ALELO.2^2)+ALELO.1:ALELO.2, data=na.omit(PILM))
summary(mod2)
step(object = mod2, direction = "backward", trace = 0)
modelo<-lm(formula = EDAD.INICIO ~ ALELO.1 + I(ALELO.1^2), data = PILM)
vif(modelo)

anova_result <- aov(EDAD.INICIO ~ ALELO.1, data = PILM)
summary(anova_result)
anova_result <- aov(EDAD.INICIO ~ I(ALELO.1^2), data = PILM)
summary(anova_result)

#ATXN1 age of onset model----
PILM<-select(PI,EDAD.INICIO,ALELO1.SCA1,ALELO2.SCA1,CODIGO.SCA1) 
mod2<-lm(EDAD.INICIO ~CODIGO.SCA1 +ALELO1.SCA1+I(ALELO1.SCA1^2)+ALELO2.SCA1+I(ALELO2.SCA1^2)+ALELO1.SCA1:ALELO2.SCA1, data=na.omit(PILM))
summary(mod2)
step(object = mod2, direction = "backward", trace = 0)
summary(lm(formula = EDAD.INICIO ~ ALELO1.SCA1 + ALELO2.SCA1 + ALELO1.SCA1:ALELO2.SCA1,data = PILM))

#ATXN2 age of onset model----
PILM<-select(PI,EDAD.INICIO,ALELO1.SCA2,ALELO2.SCA2,CODIGO.SCA2) 
mod2<-lm(EDAD.INICIO ~CODIGO.SCA2 +ALELO1.SCA2+I(ALELO1.SCA2^2)+ALELO2.SCA2+I(ALELO2.SCA2^2)+ALELO1.SCA2:ALELO2.SCA2, data=na.omit(PILM)) 
summary(mod2) 
step(object = mod2, direction = "backward", trace = 0)
summary(lm(formula = EDAD.INICIO ~ ALELO1.SCA2 + I(ALELO1.SCA2^2), 
           data = PILM))
