# Usando la libreria Rvest

library('rvest')

#inicializando la variable archivo con el nombre de mi pagina 
archivo <- 'pagina.html'

webpage<-read_html(archivo)

# extrayendo contenido en la clase justificado  
contenidoweb<-html_nodes(webpage,'.justificado')

#pasando la info a texto  
textoNoticia<-html_text(contenidoweb)
#viendo a priori la info en la variable textoNoticia
print(textoNoticia)
textoNoticia<-gsub("\n","", textoNoticia)
textoNoticia<-gsub("\t","", textoNoticia)
textoNoticia<-gsub("\u0080","", textoNoticia)
textoNoticia<-gsub("\u009d","", textoNoticia)
print(textoNoticia)
textoNoticia<-gsub("â\u009c","", textoNoticia)
textoNoticia<-gsub("Ãº","ú", textoNoticia)
textoNoticia<-gsub("Ã¡","é", textoNoticia)
textoNoticia<-gsub("Ã","í", textoNoticia)
textoNoticia<-gsub("Ã³","ó ", textoNoticia)
textoNoticia<-gsub("Ã©","é ", textoNoticia)
textoNoticia<-gsub("â"," ", textoNoticia)
textoNoticia<-gsub("í³","ó", textoNoticia)
textoNoticia<-gsub("í©","é", textoNoticia)
textoNoticia<-gsub("[.]"," ", textoNoticia)
textoNoticia<-gsub(",","", textoNoticia)
textoNoticia<-gsub("[(]","", textoNoticia)
textoNoticia<-gsub("[)]","", textoNoticia)

splitEspacioNoticia<-strsplit(textoNoticia, " ")[[1]]

splitEspacioNoticia<-tolower(splitEspacioNoticia)

unlistnoticias<-unlist(splitEspacioNoticia)

tablapalabras<-table(unlistnoticias)

dfPalabrasNoticia<-as.data.frame(tablapalabras)
#almacenando la información en CSV
write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")
#almacenando la información en txt

#tabla
#extraer contenido de una tabla a traves de tag table
tablaProductos<-html_nodes(webpage,".productos")
#extraer los elementos de la tabla
contenedordeTablas<-html_nodes(tablaProductos,"table")
#viendo el contenido de la posición 1,2 de la tabla

tabla1<-html_table(contenedordeTablas[1][[1]])

tabla2<-html_table(contenedordeTablas[2][[1]])

sprint(tabla1)

contenedordeTablas<-html_nodes((tablaProductos,""))

install.packages('ggplot2')

library('ggplot2')

#graficar tabla 1
tabla1 %>%
 ggplot() + 
  aes (x=NOMBRE,y=PRECIO) +
  geom_bar(stat="identity")

 #graficar tabla 2
tabla2 %>%
  ggplot() + 
  aes (x=NOMBRE,y=PRECIO) +
  geom_bar(stat="identity")

