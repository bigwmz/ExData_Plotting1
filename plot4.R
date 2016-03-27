dataFile <- "D:/study/The_data_science/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(sub_data_plot4)
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot_data1 <- as.numeric(sub_data$Global_active_power)
plot_data2 <- as.numeric(sub_data$Global_reactive_power)
plot_data3 <- as.numeric(sub_data$Voltage)
sub_met1 <- as.numeric(sub_data$Sub_metering_1)
sub_met2 <- as.numeric(sub_data$Sub_metering_2)
sub_met3 <- as.numeric(sub_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, plot_data1, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, plot_data3, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_met1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_met2, type="l", col="red")
lines(datetime, sub_met3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, plot_data2, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()