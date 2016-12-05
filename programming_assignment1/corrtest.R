
#parameters are directory (specdata),and threshold of complete cases
#output is id where nobs > threshold and correlation between sulfate and nitrate
#(returns numeric vector of length 0 or numeric vector of correlations)

corr <- function(directory = "specdata", threshold = 0) {
  #return vector with correct ids and correlation numbers
  
  #step 1 - set correct working directory
  fileslocation <- ""
  fileslocation[1] <- directory
  setwd(paste("C:/R/coursera-r-programming-johnshopkins/programming_assignment1/", fileslocation, sep = ""))
  
  #step 2 - does everything else
    #creates subset of the data for greater than threshold ids only
    #simultaneously checks for correlations
    #puts this information into the integer vector
  
  
  thresh <- threshold
  
  #set up the initial variables
  dfrm <- data.frame()
  files <- list.files()
  listcompletes <- vector("numeric", length = length(files))
  listcorrs <- vector("numeric", length = length(files))
 
  
  for (i in 1:length(files)) {
    dfrm <- rbind(dfrm, read.csv(files[i]))
    listcompletes[i] <- sum(complete.cases(dfrm[which(dfrm$ID == i),]))
    
  }
  i = 1
  for (i in 1:length(files)) {
    sulfateMon <- dfrm[which(dfrm$ID == i), "sulfate"]
    nitrateMon <- dfrm[which(dfrm$ID == i), "nitrate"]
    listcorrs[i] <- cor(sulfateMon, nitrateMon, use = "pairwise.complete.obs")
  }
  
  newdf <- data.frame(cbind(listcompletes, listcorrs))
  
  as.vector(newdf[which(newdf$listcompletes > thresh), "listcorrs"], mode = "numeric")
  
}
  
#   
#   #newdf has now also number complete records
#   dfrm <- cbind(dfrm, listcompletes)
#   colnames(newdf) <- c("files", "nobs")
#   
#   listcorrs <- vector("numeric", length = length(newdf$id[which(newdf$nobs > thresh)]))
#   row2 <- 1
#   for (rows in newdf) {
#     if (newdf$nobs > thresh) {
#       #listcorrs[row2] <- cor(dfrm$nitrate, dfrm$sulfate)
#       listcorrs[row2] <- cor(dfrm[which(dfrm$ID == i ), "sulfate"], dfrm[which(dfrm$ID == i ), "nitrate"])
#     }
#     
#   }
#   
#  
# }
# 
# #testing
# 
# sum(complete.cases(dfrm[which(dfrm$ID == 2),]))
#                    
# sulfateMon2 <- dfrm[which(dfrm$ID == 2), "sulfate"]
# 
# nitrateMon2 <- dfrm[which(dfrm$ID == 2), "nitrate"]
#                    
# class(nitrateMon2)                   
#                    
# cor(sulfateMon2, nitrateMon2, use = "pairwise.complete.obs") 
# 

# #yes!!!      


