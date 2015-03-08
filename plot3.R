#Read Data
data<-read.table('household_power_consumption.txt', sep = ';',header = TRUE,stringsAsFactors = F)
data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data<-cbind(DateTime=as.POSIXct(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S"),data[,3:9])

#Plot3
plot(data$DateTime,as.numeric(data$Sub_metering_1),type='n',xlab="",ylab="Energy sub metering",cex=.6)
lines(data$DateTime,as.numeric(data$Sub_metering_1))
lines(data$DateTime,as.numeric(data$Sub_metering_2),col = 'red')
lines(data$DateTime,as.numeric(data$Sub_metering_3),col='blue')
legend("topright",lty = c(1,1,1),cex=.6,col=c('black','red','blue'),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,'plot3.png')
dev.off()