
#Se usa la libreria rvest
library('rvest')

#Se asigna página para extracción de datos
paginaMostrador<-'https://www.elmostrador.cl/mercados '

#Se lee el HTML de la página
páginawebMostrador<-read_html(paginaMostrador)

#Extracción del texto contenido en la clases h3 y h4
contenidoWebMostrador<-html_nodes(páginawebMostrador,"h4")
contenidoWebMostrador1<-html_nodes(páginawebMostrador,"h3")

# viendo el contenido de la posición de 2 al 5 de la variable contenidoWebMostrador
print(contenidoWebMostrador[2:5])

# Extrayendo el texto de contenidoWebMostrador de la clase h4, sin considerar titulos
textoMostrador<-html_text(contenidoWebMostrador[2:5])

# Extrayendo el texto de contenidoWebMostrador de la clase h4, sin considerar titulos
# y agregandolos a textoMostrador creado anteriormente.
textoMostrador<-c(textoMostrador,html_text(contenidoWebMostrador1[2:40]))

# Viendo que tiene la posición 1 la variable textoXVideos
print(textoMostrador)

#limpiando el texto para reconocer solo palabras
textoMostrador<-gsub("\r","", textoMostrador)
textoMostrador<-gsub("\n","", textoMostrador)
textoMostrador<-gsub("\t","", textoMostrador)
textoMostrador<-gsub("[.]","", textoMostrador)
textoMostrador<-gsub("[,]","", textoMostrador)
textoMostrador<-gsub("[:]","", textoMostrador)
textoMostrador<-gsub("[?]","", textoMostrador)
textoMostrador<-gsub("[¿]","", textoMostrador)
textoMostrador<-gsub("MERCADOS","", textoMostrador)
textoMostrador<-gsub("Síganos","", textoMostrador)
textoMostrador<-gsub("\"","", textoMostrador)
textoMostrador<-gsub("","", textoMostrador)
textoMostrador<-gsub("[¡]","", textoMostrador)
textoMostrador<-gsub("[!]","", textoMostrador)
#Utilización de for para eliminar los grandes espacios entre los titulos

for(i in 1:20){
  textoMostrador<-gsub("  "," ", textoMostrador)
}

#Se unifican los títulos
todosLosTitulosMostrador <-""
for(i in 1:length(textoMostrador)) {
  todosLosTitulosMostrador<-paste(todosLosTitulosMostrador,"",textoMostrador[[i]])
}

# Se muestran las palabras por separado de todos los títulos
print(todosLosTitulosMostrador)

# Se dividen las palabras para poder ordenarlas.
splitEspacioMostrador<-strsplit(todosLosTitulosMostrador," ") 

# Se muestran todas las palabras vistas en las noticias
unlistnoticias<-unlist(splitEspacioMostrador)

# Se ordenan las palabras por orden alfabético y se asigna la frecuencia de cada una
tablapalabras<-table(unlistnoticias)

# Se realiza la lista final con las palabras ordenadas en orden alfabético
# y con la frecuencia de cada una
PalabrasContadas<-as.data.frame(tablapalabras)

#Se guardan la lista realizada anteriormente en formato csv
write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")



