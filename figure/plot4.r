library(lubridate)
variable.class<-c(rep('character',2),rep('numeric',7))
dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?',colClasses=variable.class)
dataset<-dataset[dataset$Date=='1/2/2007' | dataset$Date=='2/2/2007',]
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(dataset)<-cols
dataset$DateTime<-dmy(dataset$Date)+hms(dataset$Time)
dataset<-dataset[,c(10,3:9)]
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(dataset$DateTime,dataset$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')
plot(dataset$DateTime,dataset$Voltage,xlab='datetime',ylab='Voltage',type='l')
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(dataset$DateTime,dataset$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(dataset$DateTime,dataset$SubMetering2,col=lncol[2])
lines(dataset$DateTime,dataset$SubMetering3,col=lncol[3])
plot(dataset$DateTime,dataset$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')
dev.off()
