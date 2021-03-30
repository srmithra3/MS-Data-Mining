data <- read.csv("lenses.csv",FALSE)
data
str(data)
names(data)
names(data)[names(data)=="V2"]<-"PatientAge"
names(data)[names(data)=="V3"]<-"Prescription"
names(data)[names(data)=="V4"]<-"Astigmatic"
names(data)[names(data)=="V5"]<-"TPR"
names(data)[names(data)=="V6"]<-"Classes"
names(data)
data$PatientAge<-replace(data$PatientAge,data$PatientAge==1,'young')
data$PatientAge<-replace(data$PatientAge,data$PatientAge==2,'pre-presbyopic')
data$PatientAge<-replace(data$PatientAge,data$PatientAge==3,'presbyopic')
data$Prescription<-replace(data$Prescription,data$Prescription==1,'myope')
data$Prescription<-replace(data$Prescription,data$Prescription==2,'hypermetrope')
data$Astigmatic<-replace(data$Astigmatic,data$Astigmatic==1,'no')
data$Astigmatic<-replace(data$Astigmatic,data$Astigmatic==2,'yes')
data$TPR<-replace(data$TPR,data$TPR==1,'reduced')
data$TPR<-replace(data$TPR,data$TPR==2,'normal')
data$Classes<-replace(data$Classes,data$Classes==1,'hard lens')
data$Classes<-replace(data$Classes,data$Classes==2,'soft lens')
data$Classes<-replace(data$Classes,data$Classes==3,'no lens')
install.packages("C50")
library(C50)
data_train<-data[1:20,]
data_test<-data[21:24,]
nrow(data_train)
nrow(data_test)
set.seed(10203)
str(data)
str(data_train)
str(data_test)
data_train$Classes<-as.factor(data_train$Classes)
data_train$PatientAge<-as.factor(data_train$PatientAge)
data_train$Prescription<-as.factor(data_train$Prescription)
data_train$Astigmatic<-as.factor(data_train$Astigmatic)
data_train$TPR<-as.factor(data_train$TPR)
data_test$Classes<-as.factor(data_test$Classes)
data_test$PatientAge<-as.factor(data_test$PatientAge)
data_test$Prescription<-as.factor(data_test$Prescription)
data_test$Astigmatic<-as.factor(data_test$Astigmatic)
data_test$TPR<-as.factor(data_test$TPR)
data_new<-as.data.frame(data)
str(data_new)
m<-C5.0(data_train[-5],data_train$Classes)
m
summary(m)
p<-predict(m,data[21:24,])
p
table(data[21:24,1],p)
plot(m)
install.packages("gmodels")
library(gmodels)
CrossTable(data_test$Classes, p)