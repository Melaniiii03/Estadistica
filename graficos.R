
# ______________Gráficos____________
#  Se va a trabajar con la matriz penguins

#--------------------------------------------
# Importación de matriz 
#-------------------------------------------

# Import data / from excel /browse / seleccionar archivo / aceptar

#--------------------------------------
#    Exploracion
#-----------------------------------

dim(Penguins)
colnames(Penguins)
str(Penguins)
anyNA(Penguins)

# Estadistica descriptiva
summary(Penguins)

#-----------------------------------------
# Configuración de la matriz
#------------------------------------------
#Visualización de las variables
Penguins$especie
Penguins$isla
Penguins$genero
Penguins$año

#1.- Convertir las variables categóticas a factores
Penguins$especie<-factor(Penguins$especie, 
                         levels=c("Adelie", "Gentoo", "Chinstrap"))


Penguins$isla<-factor(Penguins$isla, 
                      levels=c("Torgersen", "Biscoe", "Dream"))


Penguins$genero<-factor(Penguins$genero, 
                        levels=c("male", "female"))

Penguins$año<-factor(Penguins$año, 
                     levels=c("2007", "2008", "2009"))

str(Penguins)

summary(Penguins)

View(Penguins)

# ---Este paso no es opcional.---
# 2.- Creamos una nueva matriz de datos donde se seleccionan
# las columnas de la 2 a la 9.
BD1<-Penguins[,2:9]

colnames(BD1)

#---------------------------------
#   Librerías
#----------------------------------
install.packages("ggplot2")

library(ggplot2)


# ------------------------------------------------
#         Boxplot
#--------------------------------------------------

# 1.- Creación de un vector de color
color=c("darkslategray1","darkolivegreen1")

# 2.- Creacion del grafico

BX<-ggplot(BD1, aes(x=genero, y=largo_pico_mm))+
  geom_boxplot(fill=color)+
  ggtitle("Boxplot")+
  xlab("Género")+
  ylab("largo de la aleta (mm)")+
  theme_bw()

# 3.- Visualización del boxplot
BX

#--------------------------------------------------
#            Gráfico de barras
#--------------------------------------------------

# 1.- Creación de un vector de color
color=c("khaki1", "lightpink", "lightblue")

# 2.- Creación del gráfico
GB1<-ggplot(Penguins, aes(x=año))+
  geom_bar(colour= "darkslateblue", fill=color)+
  ggtitle("Gráfico de Barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  theme_minimal()

# 3.- Visualizacion del grafico
GB1

# 4.- Barras verticales
color=c("darkseagreen1", "lavenderblush", "lightgoldenrod")

GB2<-ggplot(Penguins, aes(x=año))+
  geom_bar(colour= "dodgerblue4", fill=color)+
  ggtitle("Gráfico de Barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  coord_flip()+
  theme_minimal()

# 5. Visualizacion del objeto
GB2

#--------------------------------------------------
#           Histograma
#---------------------------------------------------

# 1.- Construccion del grafico

HG<-ggplot(Penguins, aes(x=largo_aleta_mm))+
  geom_histogram(col="black", fill="cornflowerblue")+
  ggtitle("Histograma")+
  xlab("Largo de la aleta (mm)")+
  ylab("Frecuencias")+
  theme_classic()

# 2.- Visualizacion del grafico
HG

#----------------------------------
#   Grafico de dispersion
#-----------------------------------

# 1.- Construccion del grafico

GD<-ggplot(Penguins, aes(x=largo_pico_mm, y=grosor_pico_mm))+
  geom_point(aes(color=especie))+
  scale_colour_manual(values=c("khaki", "cornflowerblue", "lightpink"))+
  ggtitle("Gráfico de dispersión")+
  xlab("largo del pico (mm)")+
  ylab("grosor del pico (mm)")+
  theme_light()

# 2.- Visualizacion del objeto
GD

#-------------------------------
#  Organizacion de graficos
#-------------------------------

# 1.- Descargar el paquete gridExtra

install.packages("gridExtra")

# 2.- Abrir la libreria
library(gridExtra)

# 3.- Organizacion 2 graficos en una fila y dos columnas 
grid.arrange(BX,GB1, nrow=1, ncol=2)

# 4.- Organizacion 3 graficos en dos filas y dos columnas 
grid.arrange(BX,GB1,HG, nrow=2, ncol=2)

# 5.- Organizacion 4 graficos en dos filas y dos columnas 
grid.arrange(BX,GB1,HG,GD, nrow=2, ncol=2)