#reading in data
data<-read.table('household_power_consumption.txt', header = TRUE, sep = ';',stringsAsFactors=FALSE, dec=".")
data$Date<-strptime(data$Date, '%d/%m/%Y')
data2<-subset(data, Date=='2007-2-1' | Date=='2007-2-2')

#plotting
Global_active_power<-as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()