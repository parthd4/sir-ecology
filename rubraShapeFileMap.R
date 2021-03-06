setwd("/Users/Parth/Desktop/R/oakshapemaps/rubra")

library(rgdal)
library(maptools)
library(maps)

oaks.data=read.csv("oaksphenometricnps.csv")    #Read from file
summary(oaks.data)
dat.new <- aggregate(oaks.data[,c("First_Yes_DOY")],
                     by=oaks.data[,c("Longitude", "Latitude", "Genus", "Species")],
                     FUN=mean, na.rm=T)

myShape<-readOGR("/Users/Parth/Desktop/R/oakshapemaps/rubra",layer="querrubr")

mycol <- rgb(255, 255, 255, max = 255, alpha = 254)

map(database= "usa", col="#AAAAAA22", fill=TRUE,lty=0)

plot(myShape, col="light green", add=TRUE)

map(database="state", col="dark gray", fill=FALSE, add=TRUE)

points(oaks.data[oaks.data$Species=="rubra","Longitude"], oaks.data[oaks.data$Species=="rubra","Latitude"], pch=19, col="red", cex=0.8)  #plot my sample sites
title(main="Quercus rubra", col.main="black", font.main=4)


plot(myShape, col=mycol, add=TRUE)
