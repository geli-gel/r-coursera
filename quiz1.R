#quizu

setwd("C:/R/quiz1data/")
quizdata <- read.csv("hw1_data.csv")

head(quizdata,2)
tail(quizdata,2)
quizdata[47,]
summary(quizdata)

mean(quizdata$Ozone[!is.na(quizdata$Ozone)])

OzOv31TempOv90 <- quizdata[quizdata$Ozone > 31 & quizdata$Temp > 90,]


mayOzone <- quizdata[quizdata$Month == 5,"Ozone"]
maxOzMay <- max(quizdata[quizdata$Month == 5,"Ozone"])
maxOzMay
mayOzone
max(mayOzone)
summary(mayOzone)
max(mayOzone, na.rm = TRUE)

