#exploratory data analysis - project
#unzip a file
file <- "exdata_data_household_power_consumption.zip"
unzip(file)
datafile <- "./household_power_consumption.txt"
#reading from a text file
data <- read.table(datafile, header=TRUE, sep=";", dec=".")
#subset of the data applying a filter
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#create a png output
png("plot1.png",height = 480, width = 480)
#convert a column to numeric format and create the histogram
hist(as.numeric(as.character(subset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#closing the png file
dev.off()