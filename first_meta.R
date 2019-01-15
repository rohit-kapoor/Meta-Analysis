rm(list=ls())
library(metafor)

new_data<-dat.mcdaniel1994
head(new_data)
new_data

resM <- rma(ri=ri, ni=ni, measure='ZCOR', data=dat.mcdaniel1994)
resM

forest(resM)
funnel(resM)

mcdanielStruct <- dat.mcdaniel1994[order(dat.mcdaniel1994$struct, dat.mcdaniel1994$ri), ]
mcdanielStruct

resStruct <- rma(ri=ri, ni=ni, measure='ZCOR', method='DL', data=mcdanielStruct, mods = ~mcdanielStruct$struct)
resStruct
