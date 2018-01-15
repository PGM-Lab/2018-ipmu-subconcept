######################################################################
## author:        Rafael Cabañas (rcabanas@decsai.ugr.es)
## date:          15th January 2018
## description:   Transforms the data set kddcup_discrete.arff with
##                discrete variables into an equivalent one with 
##                continuous variabels. 
##             
######################################################################

rm(list=ls())
library(RWeka)
setwd(dirname(sys.frame(1)$ofile))
source("lib/utilCDD.R")


datapath = "../datasets/"

##### Generation parameters #####

# Size of each file in the distributed data set
fileSize = 25000

########## Saving data #########

inputdata = read.arff(paste(c(datapath, "kddcup_discrete.arff"), collapse=""))

databin = preprocessing(inputdata, getDomains(inputdata), iclass=4, FALSE, dropClass = TRUE)
prefixFile =  paste("kddcupNoClass_", fileSize/1000, "k", sep="") 
splitAndSave(databin, datapath, prefixFile, fileSize)



#####


