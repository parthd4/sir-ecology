
library(ggplot2)
library(gridExtra)

setwd("/Users/Parth/Desktop/R/2018phenologyproject/")

shrub.data <- read.csv("KingsGrove_Shrubs_2017.csv")

cshrub.data<-read.csv("shrubstocombinegraphs.csv")

s1 <-ggplot(data=shrub.data[shrub.data$flower_buds_observed=="Y",]) + 
  ggtitle("Flower Buds Observed") + labs(x="genus", y="Day of Year") +
  geom_boxplot(aes(x=genus, y=doy, fill=genus))+geom_jitter(aes(x=genus,y=doy))+ theme(legend.position="none")

s2 <- ggplot(data=shrub.data[shrub.data$flower_open_observed=="Y",]) + 
  ggtitle("Open Flowers Observed") +labs(x="Species", y="Day of Year") +
  geom_boxplot(aes(x=genus, y=doy, fill=genus))+geom_jitter(aes(x=genus,y=doy))+ theme(legend.position="none")

s3 <-ggplot(data=shrub.data[shrub.data$fruit_observed=="Y",]) + 
  ggtitle("Fruit Observed") +labs(x="Species", y="Day of Year") +
  geom_boxplot(aes(x=genus, y=doy, fill=genus))+geom_jitter(aes(x=genus,y=doy))+ theme(legend.position="none")

s4 <-ggplot(data=shrub.data[shrub.data$fruit_ripe_observed=="Y",]) + 
  ggtitle("Ripe Fruit Observed") +labs(x="Species", y="Day of Year") +
  geom_boxplot(aes(x=genus, y=doy, fill=genus))+geom_jitter(aes(x=genus,y=doy))+ theme(legend.position="none")

s5 <-ggplot(data=shrub.data[shrub.data$leaf_observed=="Y",]) + 
  ggtitle("Leaf Observed") +labs(x="Species", y="Day of Year") +
  geom_boxplot(aes(x=genus, y=doy, fill=genus))+geom_jitter(aes(x=genus,y=doy))+ theme(legend.position="none")

s6 <-ggplot(data=shrub.data[shrub.data$leaf_color_observed=="Y",]) + 
  ggtitle("Leaf Color Observed") +labs(x="Species", y="Day of Year") +
  geom_boxplot(aes(x=genus, y=doy, fill=genus))+geom_jitter(aes(x=genus,y=doy))+ theme(legend.position="none")

require(gridExtra)
grid.arrange(s1, s2, s3, s4, s5, s6, ncol=3)

#anova for ^these things by genus
summary(aov(doy~genus, data=shrub.data[shrub.data$flower_buds_observed=="Y",]))
summary(aov(doy~genus, data=shrub.data[shrub.data$flower_open_observed=="Y",]))
summary(aov(doy~genus, data=shrub.data[shrub.data$fruit_observed=="Y",]))
summary(aov(doy~genus, data=shrub.data[shrub.data$fruit_ripe_observed=="Y",]))
summary(aov(doy~genus, data=shrub.data[shrub.data$leaf_observed=="Y",]))
summary(aov(doy~genus, data=shrub.data[shrub.data$leaf_color_observed=="Y",]))

#ttests for ^these things by nativity
t.test(doy~nativity, data=shrub.data[shrub.data$flower_buds_observed=="Y",])
t.test(doy~nativity, data=shrub.data[shrub.data$flower_open_observed=="Y",])
t.test(doy~nativity, data=shrub.data[shrub.data$fruit_observed=="Y",])
t.test(doy~nativity, data=shrub.data[shrub.data$fruit_ripe_observed=="Y",])
t.test(doy~nativity, data=shrub.data[shrub.data$leaf_observed=="Y",])
t.test(doy~nativity, data=shrub.data[shrub.data$leaf_color_observed=="Y",])

#combined graph by species
positions <- c("Leaf_Observed", "Fruit_Observed", "Ripe_Fruit_Observed")
positions2 <- c("L. maacki", "R. cathartica", "R. allegheniensis")

cshrub.data$Species <- factor(cshrub.data$Species, levels=c("R. allegheniensis", "L. maackii", "R. cathartica"))

ggplot(data=cshrub.data)+
  ggtitle("Phenology of Invasive and Native Shrubs")+
  geom_boxplot(aes(x=phenophase, y=doy, fill=Species))+scale_x_discrete(limits = positions)+
  labs(x="Phenophase", y="Day of Year")

                                                        