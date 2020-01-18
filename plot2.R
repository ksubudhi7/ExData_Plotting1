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
#check the date format
str(date)
#change the format of global active power 
globalactivepower <- as.numeric(subset$Global_active_power)
#check the format
str(globalactivepower)
#create a png output
png("plot2.png",height = 480, width = 480)
#convert a column to numeric format and create the histogram
plot(date,globalactivepower,type ="l",xlab = "",ylab="Global Active Power(kilowatts)")
#closing the png file
dev.off()
