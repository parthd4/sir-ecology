#Oak Species from NPN: A simple US Map
#Parth Dhyani
#Feb 8, 2017



setwd("/Users/Parth/Desktop/R/imsatest/")
oaks.data=read.csv("oaksphenometricnps.csv")    #Read from file
summary(oaks.data)

dat.new <- aggregate(oaks.data[,c("First_Yes_DOY")],
                     by=oaks.data[,c("Longitude", "Latitude", "Genus", "Species")],
                     FUN=mean, na.rm=T)
write.csv(dat.new, file = "aggregate_npn_oaks.csv", row.names=F)

library(maps)
library(mapdata)
library(plyr)

map(database= "state", col="gray", fill=FALSE)
map(database= "usa", col="gray", fill=FALSE,add=TRUE, lwd=0.9)   # the overwrite of boundary
map(database= "usa", col="#AAAAAA22", fill=TRUE,lty=0,add=TRUE)

#a=count(oaks.data,'Site_ID')

points(oaks.data$Longitude,oaks.data$Latitude)

#Plots the three most
points(oaks.data[oaks.data$Species=="rubra","Longitude"], oaks.data[oaks.data$Species=="rubra","Latitude"], pch=19, col="red", cex=0.8)  #plot my sample sites
points(oaks.data[oaks.data$Species=="alba","Longitude"], oaks.data[oaks.data$Species=="alba","Latitude"], pch=15, col="dark green", cex=0.8)  #plot my sample sites
points(oaks.data[oaks.data$Species=="velutina","Longitude"], oaks.data[oaks.data$Species=="velutina","Latitude"], pch=17, col="blue", cex=0.8)  #plot my sample sites
       
legend('bottomleft', title="Most Recorded Oaks", c("Q. rubra","Q. alba","Q. velutina"), pch=c(19,15,17),col=c("dark green", "red", "blue"))

title(main="Location of NPN Oak Trees", col.main="black", font.main=4)

#plots the other shared oaks
points(oaks.data[oaks.data$Species=="palustris","Longitude"], oaks.data[oaks.data$Species=="palustris","Latitude"], pch=20, col="black", cex=0.75)  #plot my sample sites
points(oaks.data[oaks.data$Species=="macrocarpa","Longitude"], oaks.data[oaks.data$Species=="macrocarpa","Latitude"], pch=20, col="orange", cex=0.75)  #plot my sample sites
points(oaks.data[oaks.data$Species=="montana","Longitude"], oaks.data[oaks.data$Species=="montana","Latitude"], pch=20, col="purple", cex=0.75)  #plot my sample sites
points(oaks.data[oaks.data$Species=="imbricaria","Longitude"], oaks.data[oaks.data$Species=="imbricaria","Latitude"], pch=20, col="yellow", cex=0.75)  #plot my sample sites
points(oaks.data[oaks.data$Species=="shumardii","Longitude"], oaks.data[oaks.data$Species=="shumardii","Latitude"], pch=20, col="cyan", cex=0.75)  #plot my sample sites

legend('bottomright', title="Less Recorded Oaks", c("Q. palustris","Q. macrocarpa","Q. montana", "Q. imbricaria", "Q. shumardii"), pch=c(20),col=c("black", "orange", "purple","yellow","cyan"))

