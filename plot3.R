#Read File Household Power Consumption
dataFile <- read.table("D:household_power_consumption.txt", sep= ";", header = TRUE)
#data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- dataFile[dataFile$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$Time <- strptime(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

# Plot 3
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(as.character(subSetData$Sub_metering_1))
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(subSetData$Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subSetData$Time, subMetering2, type="l", col="red")
lines(subSetData$Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()