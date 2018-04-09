#Read File Household Power Consumption
dataFile <- read.table("D:household_power_consumption.txt", sep= ";", header = TRUE)
#data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- dataFile[dataFile$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$Time <- strptime(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

# Plot 1
globalActivePower <- as.numeric(as.character(subSetData$Global_active_power))
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()