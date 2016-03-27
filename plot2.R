dataFile <- "D:/study/The_data_science/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(sub_data_plot2)
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot_data <- as.numeric(sub_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, plot_data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()