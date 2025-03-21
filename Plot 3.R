### read data from txt
data_power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_power$Date <- as.Date(data_power$Date, format = "%d/%m/%Y")
head(data_power)

### subset data
data_power_plot <- subset(data_power, data_power$Date >= as.Date("2007-02-01") & data_power$Date <= as.Date("2007-02-02"))

### Date+Time
data_power_plot$DateTime <- as.POSIXct(paste(data_power_plot$Date, data_power_plot$Time))

### Plot 3
plot (data_power_plot$DateTime, data_power_plot$Sub_metering_1,
      type = "l",
      col = "black",
      ylab = "Energy sub metering",
      xlab = "",
      xaxt = "n")

### Adjust X-axis
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "day"), 
             format = "%a")

### Add lines
lines(data_power_plot$DateTime, data_power_plot$Sub_metering_2, col="red")
lines(data_power_plot$DateTime, data_power_plot$Sub_metering_3, col="blue")

### Add legend
legend("topright",
       legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c ("black", "red", "blue"),
       lty = 1,
       lwd = 1)

