setwd("/Users/home/4_Exploratory_Data_Analysis/week_1/course_project_1")

data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")
data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data_subset$DateTime <- paste(data_subset$Date, " ", data_subset$Time)
data_subset$DateTime <- strptime(data_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")

graphics.off()
hist(data_subset$Global_active_power, col = 2, xlab = "Globa Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480,height = 480)
dev.off()