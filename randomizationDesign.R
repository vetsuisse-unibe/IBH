# Load necessary libraries
library(dplyr)
library(ggplot2)
library(blockrand)
set.seed(42)

## stratified by IBH and vaccination
IBH.vacc<-blockrand(n=12, num.levels = 2, levels = c("Stim", "NotStim"),id.prefix  = 'IBH.VA', block.prefix = 'IBH.VA', stratum='IBH-Vaccinated',block.sizes = c(2,2))
IBH.nvacc<-blockrand(n=12, num.levels = 2, levels = c("Stim", "NotStim"),id.prefix  = 'IBH.NVA', block.prefix = 'IBH.NVA', stratum='IBH-Non-Vaccinated',block.sizes = c(2,2))
H.vacc<-blockrand(n=12, num.levels = 2, levels = c("Stim", "NotStim"),id.prefix  = 'H.VA', block.prefix = 'H.VA', stratum='H-Vaccinated',block.sizes = c(2,2))
H.nvacc<-blockrand(n=12, num.levels = 2, levels = c("Stim", "NotStim"),id.prefix  = 'H.NVA', block.prefix = 'H.NVA', stratum='H-Non-Vaccinated',block.sizes = c(2,2))
horse.study<-rbind(IBH.nvacc,IBH.vacc,H.nvacc,H.vacc)
write.table(horse.study,file="IBHdesign.txt",sep="\t",quote=F,row.names = F)
#shuffle the data frame 
shuffled_data= horse.study[sample(1:nrow(horse.study)), ]
write.table(shuffled_data,file="IBHdesign.shuffled.txt",sep="\t",quote=F,row.names = F)

