setwd("/Users/home/4_Exploratory_Data_Analysis/week_1/course_project_1")

data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")
data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data_subset$DateTime <- paste(data_subset$Date, " ", data_subset$Time)
data_subset$DateTime <- strptime(data_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")

graphics.off()
par(mfrow = c(2,2))
with(data_subset, {
  plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', pch = '.')
  lines(DateTime, Global_active_power, pch='.')
  plot(DateTime, Voltage, xlab = 'datetime', ylab = 'Voltage', pch = '.')
  lines(DateTime, Voltage, pch='.')
  plot(data_subset$DateTime, data_subset$Sub_metering_1, col = 'black', pch = '.', xlab = "", ylab = 'Energy sub metering')
  lines(data_subset$DateTime, data_subset$Sub_metering_1, col = "black", pch =  '.')
  lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red", pch =  '.')
  lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue", pch =  '.')
  legend("topright", pch = '', lty = 1, col = c("black", "red", "blue"), bty = 'n', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', pch = '.')
  lines(DateTime, Global_reactive_power, pch='.')
})
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()