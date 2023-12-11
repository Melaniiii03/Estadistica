#1.- Exportación de la matriz de datos 

marvel_dc<-read_excel("marvel_dc.xls")

#2.- Exploración de la matriz 

# 1.- Importación de la matriz
data(marvel_dc)

# 2.- Dimensión de la matriz
dim(marvel_dc)

# 3.- Nombre de las columnas
colnames(marvel_dc)

# 4.- Tipo de variables
str(marvel_dc)

# 5.- En busca de datos perdidos
anyNA(marvel_dc)

#2.1.- Dimensión de la matriz

#Se utiliza el siguiente comando para saber
#la dimensión de la matriz:
#  **dim(BD)**

dim(marvel_dc)

#2.2.- En busca de datos perdidos

#Buscamos si tenemos datos perdidos o no con 
# **anyNA(BD)**

anyNA(marvel_dc)

#3.- Tipo de variables

#Para identificar las variables cuantitativas
# **str(BD)**

str(marvel_dc)

#4.- Para saber el nombre y posición de la variable ocupamos:
#  **colnames(BD)**

colnames(marvel_dc)

#5.- Seleccionamos las variables:
#  rate, minutos, budget y gross.worldwide, con:
#  **marvel<-marvel_dc[,c(4,6,8,11)]**
#  *Nota: elegimos columnas nuevas, debido a que la número 4 
#y la 6 son carácteres y necesitamos utilizar numéricas

#Ocuparemos las variables:
#  rate, metascore, gross USA y gross Worldwide

marvel<-marvel_dc[,c(4,5,10,11)]

#6.- Verificar que el nombre de las variables 
#esten correctas utilizando:
#  **colnames(marvel)**

colnames(marvel)

#7.- Realizar un plot de exploración con:
#  **plot(marvel)**

plot(marvel)

#8.- Realizar la correlación de spearman con:
#  **spearman<-cor(marvel, method = "spearman")**

spearman<-cor(marvel,method="spearman")

#9.- Vizualizar el objeto 

spearman 

#9.2.- Se abre la librería knitr

library(knitr)

#10.- Se utiliza la funcion kable para tabla en 
#formato markdown.
# **kable(spearman)**

kable(spearman)