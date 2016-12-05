
#parameters are directory (specdata),and which monitor id(s) (name of file)

complete <- function(directory = "specdata", id = 1:332) {
  #return data frame with ids selected and number of 
  #complete cases per id
  
  #step 1 - set correct working directory
  fileslocation <- ""
  fileslocation[1] <- directory
  setwd(paste("C:/R/coursera-r-programming-johnshopkins/programming_assignment1/", fileslocation, sep = ""))
  
  #step 2 - does everything else
    #creates subset of the data for ids only
    #simultaneously checks for complete cases and 
    #store new data frame col 1 ids, col 2 nobs
  
  #set up the initial variables
  dfrm <- data.frame()
  listcompletes <- vector("integer", length = length(id))
  files <- list.files()
  row <- 1
  
  for (i in id) {
    dfrm <- rbind(dfrm, read.csv(files[i]))
    listcompletes[row] <- sum(complete.cases(dfrm[which(dfrm$ID == i),]))
    row <- row + 1
  }
  newdf <- data.frame(cbind(id, listcompletes))
  colnames(newdf) <- c("id", "nobs")
  
  #no - totally wrong!
  #cbind(200:299, listcompletes)
  
  #there we go :)
  return(newdf)
}

