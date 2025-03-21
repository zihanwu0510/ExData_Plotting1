### read data from txt
data_power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_power$Date <- as.Date(data_power$Date, format = "%d/%m/%Y")
summary(data_power)

### subset data
data_power_plot <- subset(data_power, data_power$Date >= as.Date("2007-02-01") & data_power$Date <= as.Date("2007-02-02"))
head(data_power_plot, n=7)

### Plot.1
data_power_plot$Global_active_power <- as.numeric(data_power_plot$Global_active_power)
par(mar = c(5,4,4,2) + 0.1)
hist(data_power_plot$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col="Red")
