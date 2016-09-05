#reading in data
data<-read.table('household_power_consumption.txt', header = TRUE, sep = ';',stringsAsFactors=FALSE, dec=".")
data$Date<-strptime(data$Date, '%d/%m/%Y')
data2<-subset(data, Date=='2007-2-1' | Date=='2007-2-2')

#plotting
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
Global_active_power<-as.numeric(data2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab = '', ylab="Global Active Power (kilowatts)")
dev.off()
