dataFile <- "D:/study/The_data_science/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(sub_data_plot3)
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot_data <- as.numeric(sub_data$Global_active_power)
sub_met1 <- as.numeric(sub_data$Sub_metering_1)
sub_met2 <- as.numeric(sub_data$Sub_metering_2)
sub_met3 <- as.numeric(sub_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_met1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_met2, type="l", col="red")
lines(datetime, sub_met3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()