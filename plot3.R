#reading in data
data<-read.table('household_power_consumption.txt', header = TRUE, sep = ';',stringsAsFactors=FALSE, dec=".")
data$Date<-strptime(data$Date, '%d/%m/%Y')
data2<-subset(data, Date=='2007-2-1' | Date=='2007-2-2')

#plotting
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

sub1<-as.numeric(data2$Sub_metering_1)
sub2<-as.numeric(data2$Sub_metering_2)
sub3<-as.numeric(data2$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", col = 'black', xlab = '', ylab="Energy sub metering")
lines(datetime, sub2, type="l", col = 'red')
lines(datetime, sub3, type="l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
