# DATA DISCOVERING

#Cargar libreria
library(VIM)
library(dplyr)
library(naniar)
library(lubridate)

#Cargar datos
datos<- read.csv("C:/Users/Larau/Downloads/Ejemplo_ExamenReto4_2024 (3)/Ejemplo_ExamenReto4_2024/water-quality-data.csv")

#Analizar datos
str(datos)
dim(datos)
head(datos)
summary(datos)

#1. Rangos de las variables numericas
summary(datos[,c(9,10,11)])
sd_MDL<- sd(datos$MDL, na.rm=T)
sd_Value<- sd(datos$Value,na.rm=T)
sd_RDL<- sd(datos$RDL, na.rm=T)

#2. Calidad de agua por area. Muestra los valores de las areas 5,20 y 33
datos_calidad_agua<- datos%>% group_by(Area) %>% summarise(Media_MDL= mean(MDL, na.rm=T),
                                                           Media_RDL=mean(RDL, na.rm=T),
                                                           Media_Value=mean(Value, na.rm=T))
datos_calidad_agua[c(5,20,30),]
