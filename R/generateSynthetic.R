######################################################################
## author:        Rafael Cabañas (rcabanas@decsai.ugr.es)
## date:          8th September 2017
## description:   Generation of the synthetic data in arff format 
##                (section 4.1 of the paper)
######################################################################

library(RWeka)
setwd(dirname(sys.frame(1)$ofile))
source("lib/utilCDD.R")


datapath = "../datasets/"
seed = "1234"

##### Generation parameters #####

# Number of instanches for each distribution
nInstances = 2000
# Size of each file in the distributed data set
fileSize = 2000

# sampling distributions for X and Y
pX = cbind(c(0.2,0.2,0.6),
            c(0.6,0.2,0.2),
            c(0.8,0.0,0.2),
            c(0.2,0.0,0.8),
            c(0.2,0.5,0.3),
            c(0.2,0.5,0.3))

pY = cbind(c(0.4,0.4,0.1,0.1),
            c(0.4,0.4,0.1,0.1),
            c(0.4,0.4,0.1,0.1),
            c(0.2,0.4,0.3,0.1),
            c(0.0,0.6,0.3,0.1),
            c(0.0,0.6,0.3,0.1)
            )

pC = c(0.4, 0.6)



########### Sampling #######

Nbatches = dim(pY)[2]
data = c()
set.seed(seed)

for (i in 1:Nbatches) {
  X <- sample(1:length(pX[,i]),nInstances,replace=T,prob=pX[,i])
  Y <- sample(1:length(pY[,i]),nInstances,replace=T,prob=pY[,i])
  C <- sample(1:length(pC),nInstances,replace=T,prob=pC)
  data <- rbind(data, cbind(X,Y,C))
  
}

N <- dim(data)[1]


########## Saving data #########

# discrete data  with class in a single file

filename = paste(c(datapath, "syntheticDiscrete.arff"), collapse = "");
write.arff((data[seq(1,N),,drop=FALSE]), file = filename, eol = "\n")

iclass = 3
inputdata  = read.arff(paste(c(datapath, "syntheticDiscrete.arff"), collapse=""))


# transformed data with class in multiple files

databin = preprocessing(inputdata, getDomains(inputdata), iclass, FALSE)
prefixFile =  paste("synthetic_", fileSize/1000, "k", sep="") 
splitAndSave(databin, datapath, prefixFile, fileSize)



# transformed data without class in multiple files

databin = preprocessing(inputdata, getDomains(inputdata), iclass, FALSE, dropClass = TRUE)
prefixFile =  paste("syntheticNoClass_", fileSize/1000, "k", sep="") 
splitAndSave(databin, datapath, prefixFile, fileSize)


# discrete data  with class in multiple files

prefixFile =  paste("syntheticDiscrete_", fileSize/1000, "k", sep="") 
splitAndSave(inputdata, datapath, prefixFile, fileSize)



#####


