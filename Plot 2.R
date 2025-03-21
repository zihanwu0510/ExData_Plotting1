### read data from txt
data_power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_power$Date <- as.Date(data_power$Date, format = "%d/%m/%Y")
head(data_power)

### subset data
data_power_plot <- subset(data_power, data_power$Date >= as.Date("2007-02-01") & data_power$Date <= as.Date("2007-02-02"))

### Date+Time
data_power_plot$DateTime <- as.POSIXct(paste(data_power_plot$Date, data_power_plot$Time))

### Plot 2
data_power_plot$Global_active_power <- as.numeric(data_power_plot$Global_active_power)
plot(data_power_plot$DateTime, data_power_plot$Global_active_power,
     type = "l",
     xlab = "",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)")

### Adjust X-axis
axis.POSIXct(1, at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "day"), 
             format = "%a")
