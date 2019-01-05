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
textoNoticia<-gsub("\Ã¡","á", textoNoticia)
splitEspacioNoticia<-strsplit(textoNoticia, " ")[[1]]
splitEspacioNoticia<-tolower(splitEspacioNoticia)
unlistnoticias<-unlist(splitEspacioNoticia)
tablapalabras<-table(unlistnoticias)
dfPalabrasNoticia<-as.data.frame(tablapalabras)
