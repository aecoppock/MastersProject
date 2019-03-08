########## rewrite of the distribution figure used in grant###########

################ Creation of global distribtion (from GBIF database) of C3 and C4 plant species used in project)#############
#load necessary packages
library(ggplot2)
library(dplyr)
library(maps)
#read in collated database with co-ordinates
coord<-read.csv("Data/SppCoord.csv")

#remove na values
coord<-na.omit(coord)


#read in RWorldmap
WorldData<-map_data('world')


# #p<-p+geom_map(data=WorldData,map=WorldData,
#               aes(x=long,y=lat,group=group,map_id=region),
#               fill="white",colour="#7f7f7f",size=0.5)



#p<-ggplot()
#p<-p+geom_map(data=WorldData,map=WorldData,)

############# rewrite
mp<-NULL
mapWorld<-borders("world",colour="gray50",fill="gray50") #create a layer of borders
mp<-ggplot()+mapWorld
##layer spp co-ordinates ontop
mp1<-mp+geom_point(data=coord,aes(x=decimalLongitude,y=decimalLatitude), color="blue",size=0.5)              
mp1
mp<-ggplot()+mapWorld


#rename x axis
mp<-mp+labs(x="Longitude")
#rename y axis
mp<-mp+labs(y="Latitude")
mycolours<-c("lightseagreen","sienna2")
mp3<-mp+geom_point(data=coord,aes(x=decimalLongitude,y=decimalLatitude,colour=Climatic.type,shape=C3.C4),size=1.2)+scale_colour_manual(values=mycolours)
#rename CCM legend
mp3<-mp3+labs(shape="CCM")
#rename climate legend
mp3<-mp3+labs(colour="Climate")
mp3