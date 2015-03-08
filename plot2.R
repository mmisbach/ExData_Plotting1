#Read Data
data<-read.table('household_power_consumption.txt', sep = ';',header = TRUE,stringsAsFactors = F)
data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data<-cbind(DateTime=as.POSIXct(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S"),data[,3:9])

#Plot2
plot(data$DateTime,as.numeric(data$Global_active_power),type='n',xlab="",ylab="Global Active Power (kilowatts)")
lines(data$DateTime,as.numeric(data$Global_active_power))

dev.copy(png,'plot2.png')
dev.off()