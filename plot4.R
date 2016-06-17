#setwd('e:/eda')
data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
power$Date_Time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

# Start plots
png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Sub Plot 1
power$Global_active_power <-  as.numeric(as.character(power$Global_active_power))
power$Date_Time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
with(power,plot(Date_Time,Global_active_power,type='l',xlab='',ylab='Global Acitive Power'))

# Sub Plot 2
power$Voltage = as.numeric(as.character(power$Voltage))
with(power,plot(Date_Time,Voltage,type='l',xlab='datetime'))

#Sub Plot 3
power$Sub_metering_1 <-  as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <-  as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <-  as.numeric(as.character(power$Sub_metering_3))
with(power,plot(Date_Time,Sub_metering_1,type='l',ylab='Energy sub metering',xlab=''))
with(power,lines(Date_Time,Sub_metering_2,type='l',col='red',xlab=''))
with(power,lines(Date_Time,Sub_metering_3,type='l',col='blue',xlab=''))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),bty='n')

# Sub Plot 4
power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
with(power,plot(Date_Time,Global_reactive_power,type='l',xlab='datetime'))

dev.off()
