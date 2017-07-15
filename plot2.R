data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings = "?", dec=".")

#subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert into date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)


#plotting the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()