#el mostrador
paginaMostrador<-'https://www.elmostrador.cl/mercados '

páginawebMostrador<-read_html(paginaMostrador)

# Extracción del texto contenido en la clase thumb-under
contenidoWebMostrador<-html_nodes(páginawebMostrador,".row>.columna-principal")

# viendo el contenido de la posición 1
# de la variable contenidoWebXVideos
print ( contenidoWebMostrador [ 1 ])

# Extrayendo el texto de contenidoWebXVideos
textoMostrador<-html_text(contenidoWebMostrador )

# Viendo que tiene la posición 1 la variable textoXVideos
print ( textoMostrador [ 1 ])

# Unificando los títulos .
todosLosTitulosMostrador <-  " "
para ( i  in  1  : length ( textoMostrador )) {
  todosLosTitulosMostrador <- pegar ( todosLosTitulosMostrador , "  " , textoMostrador [[ i ]])
}

textoMostrador<-gsub("\r","", textoMostrador)
textoMostrador<-gsub("\n","", textoMostrador)
textoMostrador<-gsub("\t","", textoMostrador)
print ( textoMostrador [ 1 ])

splitEspacioMostrador<-strsplit(textoMostrador, " ")[[1]]

splitEspacioMostrador<-tolower(splitEspacioMostrador)

unlistnoticias<-unlist(splitEspacioMostrador)

tablapalabras<-table(unlistnoticias)

dfPalabrasNoticia<-as.data.frame(tablapalabras)

write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")
