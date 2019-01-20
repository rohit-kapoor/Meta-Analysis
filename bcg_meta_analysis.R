#### using the BCG vaccine data to illustrate the use of rma.uni (or simply rma())
## and rma.mv() functions

rm(list = ls())

# now let us load the data
library(metafor)

dat.bcg
help("dat.bcg")
help("rma")

# calculate the log risk ratio and corresponding sampling variances
new_data<-escalc(measure='RR',ai=tpos,bi=tneg,ci=cpos,di=cneg,data=dat.bcg)
new_data

# this function has actually calculated the yi and vi values 

# now since we have the yi and the vi values we can apply the model fitting algorithm
# and actually perform the meta analysis

model<-rma(yi,vi,data=new_data)
model
forest(model)

# now we have the forest plot,lets make the funnel plot for this data
funnel(model)

# lets calculate the average risk ratio with 95% confidence interval
predict(model,transf = exp)

#### now let us use mixed effects model with absolute latitude and publication year as moderator
## variables

new_model<-rma(yi,vi,mods= ~ablat +year,data=new_data)
new_model
###
### now lets make a forest plot for the new model
forest(new_model)
funnel(new_model)
## when we take lattitude and year as moderators, the forest plot makes 
# much more sense and is almost the shape of an inverted funnel

# now we will predict the average risk ratios for 10-60 degrees absolute
# latitude holding the publication year constant at 1970

predict(new_model,newmods = cbind(seq(from=10,to=60,by=10),1970),transf=exp)

##cbind(seq(from=10,to=60,by=10),1970)
plot(new_data$ablat,new_data$year)
cor(new_data$ablat,new_data$year)

help("cor")
