#load data.table
library("data.table")
#read the txt file with power data
tab<-fread(input = "household_power_consumption.txt",na.strings="?")
#set the time format
tab[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#choose the date range
tab2 <- tab[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#png plotter
png("plot3.png", width=480, height=480)
plot(tab2[, dateTime], tab2[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(tab2[, dateTime], tab2[, Sub_metering_2],col="red")
lines(tab2[, dateTime], tab2[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  "
	, "Sub_metering_3  "), lty=c(1,1), lwd=c(1,1))

dev.off()
