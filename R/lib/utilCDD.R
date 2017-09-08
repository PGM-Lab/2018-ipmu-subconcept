
getDomains <- function(inputdata) {
  
  # read the domains
  dom <- list()
  for (i in 1:ncol(inputdata)) {
    dom[[i]] <- sort(unique(inputdata[,i]))
  }
  
  return(dom)
  
}

binarizeData <- function(inputdata, dom, iclass, append, dropClass = FALSE) {
  
  
  databin = c()
  cnames = c()
  class = c()
  
  #isClassPresent = iclass >= 0
  
  
  # process the data
  
  for (i in 1:ncol(inputdata)) {
    dom_i <- dom[[i]]
    
    if(i != iclass){
      for(j in 1:length(dom_i)) {
        
        databin <- cbind(databin,(inputdata[,i]==dom_i[j]) * 1.0)
        cnames <- c(cnames, paste(colnames(inputdata)[i], dom_i[[j]], sep = "_"))
        
      }
    }else{
      #databin <- cbind(databin, inputdata[,i]==1)
      class = inputdata[,i]==1
      #   cnames <- c(cnames, "C")
    }
  }
  
  #  colnames(databin) <- cnames
  
  
  #df = data.frame(databin, class)
  
  
  print(iclass)
  
  if(iclass & !dropClass) {
    df = data.frame(databin, class)
    cnames = c(cnames, "C")
  }else{
    df = data.frame(databin)
  }
  colnames(df) <- cnames 
  
  
  return(df)
}

splitAndSave<-function(data, datapath, prefixFile, fileSize) {
  
  
  dataSize = dim(data)[1]
  
  I = seq(1,dataSize,fileSize)
  J = seq(1,dataSize,fileSize) + fileSize - 1
  
  for (k in 1:length(I)) {
    
    i = I[k]
    j = min(J[k], dataSize)
    
    
    filename = paste(c(datapath, prefixFile, "_", k,".arff"), collapse = "");
    write.arff((data[seq(i,j),,drop=FALSE]), file = filename, eol = "\n")
    
  } 
  
  
  
}

