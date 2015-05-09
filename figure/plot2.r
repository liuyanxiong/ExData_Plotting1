setwd("C:/Users/USER/Assignment")
library(lubridate)
variable.class<-c(rep('character',2),rep('numeric',7))
dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?',colClasses=variable.class)
dataset<-dataset[dataset$Date=='1/2/2007' | dataset$Date=='2/2/2007',]
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(dataset)<-cols
dataset$DateTime<-dmy(dataset$Date)+hms(dataset$Time)
dataset<-dataset[,c(10,3:9)]
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
plot(dataset$DateTime,dataset$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()
