# API






#* @apiTitle  API Examen Iraia Laraudogoitia
#* @apiDescription  API que permite a los usuarios buscar areas que cumplan cierto criterio de calidad del agua
#* @param CalidadAgua
#* @get Water_q


function(CalidadAgua){
  CalidadAgua<- as.numeric(CalidadAgua)
  filtrado<- datos%>% filter(Value >= CalidadAgua) %>% select (Area)
  return(filtrado)
}


