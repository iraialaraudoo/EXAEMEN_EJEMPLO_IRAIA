# DATA CLEANING

library(nortest)

#1. Buscar outliers en Value, MDL y RDL

#En caso de que la vairbale siguiera una distribucion normal deberiamos usa el rosner test.

#Detectar outleirs (p-value 0.07)

#----> VALUE
boxplot(datos$Value, main="Boxplot Value")
lillie.test(datos$Value) #No sigue una distribucion normal

media_value<- mean(datos$Value, na.rm=T)
sd_Value<- sd(datos$Value,na.rm=T)
rango<- c(media_value -3*sd_Value, media_value +12*sd_Value)

#En caso de no poder utilizar ningún test para la detección de outliers filtra los valores utilizando el filtro 
#de Hampel pero utilizando 12 veces la desviación media para el límite superior. Analiza si son outliers. ¿Hay algún tipo de patrón en los casos presentes? (*0.3 puntos)
outliers_Value<- datos %>% filter(datos$Value< rango[1] | datos$Value > rango[2])
#Los mayores o iguales a 1000000 consideramos outlier

datos_value_sin_outliers<- ifelse(datos$Value == 1000000, NA, datos$Value)
datos$Value<- datos_value_sin_outliers



