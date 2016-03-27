dataFile <- "D:/study/The_data_science/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(sub_data_plot1)
plot_data <- as.numeric(sub_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(plot_data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()












