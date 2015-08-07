## reading in the household power consumption data using read.csv()
hpcdata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")

## Subsetting the data
hpcdatasubset <- subset(hpcdata, subset=(Date <= "2007-02-02" & Date >= "2007-02-01"))


## Converting dates
dates <- paste(as.Date(hpcdatasubset$Date), hpcdatasubset$Time)
hpcdatasubset$dates <- as.POSIXct(dates)

## Plot 1
hist(hpcdatasubset$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()