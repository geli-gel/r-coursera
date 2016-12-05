
#parameters are directory (specdata), pollutant (nitrate or sulfate), and which monitor id (name of file)

pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
  #return mean of pollutant across all monitors listed in id (ignoring NAs) do not round result.
  
  #step 1 - put all data from directory into a data frame
  #setwd("specdata")
  fileslocation <- ""
  fileslocation[1] <- directory
  setwd(paste("C:/R/coursera-r-programming-johnshopkins/programming_assignment1/", fileslocation, sep = ""))

  #step 2 creates subset of the data for ids only
  dfrm <- data.frame()
  files <- list.files()
  for (i in id) {
    dfrm <- rbind(dfrm, read.csv(files[i]))
  }
  #below are tests from when I was subsetting the data wrong (using id variable wrongly)
    #dfrmSubset <- dfrm[which(dfrm$ID == 4), "sulfate"] #test
    #dfrmSubset <- dfrm[which(dfrm$ID == id), ]
  
  
  #step 3 - return the mean
  mean(dfrm[,pollutant], na.rm = TRUE)
}

