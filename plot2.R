#load data.table
library("data.table")
#read the txt file with power data
tab<-fread(input = "household_power_consumption.txt",na.strings="?")
#set the time format
tab[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#choose the date range
tab2 <- tab[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#png plotter
png("plot2.png", width=480, height=480)
#plot the graph
plot(x = tab2[, dateTime], y = tab2[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
#close png saver
dev.off()