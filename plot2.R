setwd('e:/eda')
data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

power$Global_active_power <-  as.numeric(as.character(power$Global_active_power))
power$Date_Time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
with(power,plot(Date_Time,Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)'))
dev.off()