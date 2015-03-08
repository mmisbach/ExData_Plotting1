#Read Data
data<-read.table('household_power_consumption.txt', sep = ';',header = TRUE,stringsAsFactors = F)
data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data<-cbind(DateTime=as.POSIXct(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S"),data[,3:9])

#Plot1
hist(as.numeric(data$Global_active_power),col = "red")

dev.copy(png,'plot1.png')
dev.off()
