setwd("/Users/Parth/Desktop/R/oakshapemaps/velutina")

library(rgdal)
library(maptools)

oaks.data=read.csv("oaksphenometricnps.csv")    #Read from file
summary(oaks.data)
dat.new <- aggregate(oaks.data[,c("First_Yes_DOY")],
                     by=oaks.data[,c("Longitude", "Latitude", "Genus", "Species")],
                     FUN=mean, na.rm=T)

myShape<-readOGR("/Users/Parth/Desktop/R/oakshapemaps/velutina",layer="quervelu")

mycol <- rgb(123, 243, 135, max = 255, alpha = 125)

map(database= "usa", col="#AAAAAA22", fill=TRUE,lty=0)

plot(myShape, col="light green", add=TRUE)

map(database="state", col="dark gray", fill=FALSE, add=TRUE)

points(oaks.data[oaks.data$Species=="velutina","Longitude"], oaks.data[oaks.data$Species=="velutina","Latitude"], pch=19, col="red", cex=0.8)  #plot my sample sites
title(main="Quercus velutina", col.main="black", font.main=4)
