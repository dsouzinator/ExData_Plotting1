#load data.table
library("data.table")
#read the txt file with power data
tab<-fread(input = "household_power_consumption.txt",na.strings="?")
#set the day month format
tab[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
#choose the date range
tab2 <- tab[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
#png plotter
png("plot1.png", width=480, height=480)
#plot histogram
hist(tab2[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#close png saver
dev.off()