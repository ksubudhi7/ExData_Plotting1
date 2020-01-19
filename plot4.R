#exploratory data analysis - project
#unzip a file
file <- "exdata_data_household_power_consumption.zip"
unzip(file)
datafile <- "./household_power_consumption.txt"
#reading from a text file
data <- read.table(datafile, header=TRUE, sep=";", dec=".")
#subset of the data applying a filter
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#change the date and time format
date <- strptime(paste(subset$Date,subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#change the format of globalactivepower, voltage, global reactive poer and submetering to numerics 
globalactivepower <- as.numeric(subset$Global_active_power)
voltage <- as.numeric(subset$Voltage)
globalreactivepower <- as.numeric(subset$Global_reactive_power)
submetering1 <- as.numeric(subset$Sub_metering_1)
submetering2 <- as.numeric(subset$Sub_metering_2)
submetering3 <- as.numeric(subset$Sub_metering_3)
#create a png output
png("plot4.png",height = 540, width = 540)
#divide main picture into 4 panels
par(mfrow = c(2,2))
#plot the graphs
plot(date,globalactivepower,type ="l",xlab = "",ylab="Global Active Power")
plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(date, submetering2, type="l", col="red")
lines(date, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(date, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
#closing the png file
dev.off()