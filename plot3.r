## reading in the household power consumption data using read.csv()
hpcdata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")

## choose only data for 02/02/07 and 01/02/07
hpcdatasubset <- subset(hpcdata, subset=(Date <= "2007-02-02" & Date >= "2007-02-01"))


## Change the dates
dates <- paste(as.Date(hpcdatasubset$Date), hpcdatasubset$Time)
hpcdatasubset$dates <- as.POSIXct(dates)

## Plot 3
with(hpcdatasubset, {
  plot(Sub_metering_1~dates, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dates,col='Red')
  lines(Sub_metering_3~dates,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

