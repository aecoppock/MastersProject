# Script to assess anatomical measurements of cell length, vessel diameter, vessel density

# load necessary packages
library(ggplot2)
library(tidyverse)

# read in the dataframe
speciesmeasure<-read.csv("Data/SpeciesAnatomyMeasurements.csv")

veindens<-read.csv('Data/simplified vein density.csv')


# Vein diameter -----------------------------------------------------------

# plot vein diameter against moisture content
ggplot(data=speciesmeasure,aes(y=minor_vein_diameter,x=MC))+
geom_point(aes(col=clim))+
scale_color_manual(values = c("#00AFBB","#FC4E01"))+
labs(x = "Moisture Content",y = expression(paste("Vein Diameter (",mu,"m)")), col = "Climate")


# Vein density ------------------------------------------------------------


# plot vein density against moisture content
ggplot(data=veindens,aes(x=MC,y=vein_density))+
  geom_point(aes(col=clim,size=5))+
  scale_color_manual(values = c("#00AFBB","#FC4E01"))+
  labs(x = "Moisture Content", y = "Vein Density (no.of veins per mm)" , col="Climate")+
  guides(size=FALSE)


# Calculate cell lengths --------------------------------------------------

celllength <- speciesmeasure %>% 
  group_by(species) %>%
  summarise(
  mean_epilength = mean(epi_cell_length, na.rm = TRUE),
  mean_mesolength = mean(meso_cell_length,na.rm = TRUE)
  )

# Calculate cell wall thickness -------------------------------------------

epiwall <- speciesmeasure %>% 
  group_by(species) %>% 
  mean(epi_cellwallthick , na.rm=TRUE)

mean(speciesmeasure$epi_cellwallthick , na.rm=TRUE)
