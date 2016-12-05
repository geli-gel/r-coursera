#https://github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd
setwd("C:/R/coursera-r-programming-johnshopkins/diet_data")
andy <- read.csv("andy.csv")
andy_start <- andy[1, "Weight"]
andy_end <- andy[30,"Weight"]
andy[which(andy$Day == 30) , c("Day", "Weight")]
andy[which(andy[,"Day"] == 30), "Weight"]


subset(andy$Weight, andy$Day == 30)

andy_loss <- andy_start - andy_end
list.files()

files <- list.files()
files
files[1]

files[3:5]
head(read.csv(files[3]))

alldat <- data.frame()
for (i in 1:length(files)) {
  alldat <- rbind(alldat, read.csv(files[i]))
}

names(alldat$Patient.Name)
names(alldat)
summary(alldat)

median(alldat$Weight, na.rm = TRUE)
alldat
wutday <- 30
allpracticesubsetday <- alldat[which(alldat$Day == wutday),]
allpracticesubsetday
median(allpracticesubsetday[,"Weight"], na.rm = TRUE)

allPatients.dayMedian <- function(day) {
  day_subset <- alldat[which(alldat$Day == day),]
  median(day_subset[,"Weight"], na.rm = TRUE)
}
  
  