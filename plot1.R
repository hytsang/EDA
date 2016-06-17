setwd('e:/eda')
data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
power$Global_active_power <-  as.numeric(as.character(power$Global_active_power))

png(filename="plot1.png", width=480, height=480)
hist(power$Global_active_power, main='Global Active Power', col='red', xlab='Global Active Power (kilowatts')
dev.off()