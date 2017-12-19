setwd("/Users/home/4_Exploratory_Data_Analysis/week_1/course_project_1")

data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")
data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data_subset$DateTime <- paste(data_subset$Date, " ", data_subset$Time)
data_subset$DateTime <- strptime(data_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")

graphics.off()
plot(data_subset$DateTime, data_subset$Sub_metering_1, col = 'black', pch = '.', xlab = "", ylab = 'Energy sub metering')
lines(data_subset$DateTime, data_subset$Sub_metering_1, col = "black", pch =  '.')
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red", pch =  '.')
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue", pch =  '.')
legend("topright", pch = '', lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480,height = 480)
dev.off()