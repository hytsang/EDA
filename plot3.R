setwd('e:/eda')
data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
power$Date_Time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

power$Sub_metering_1 <-  as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <-  as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <-  as.numeric(as.character(power$Sub_metering_3))

png(filename="plot3.png", width=480, height=480)
with(power,plot(Date_Time,Sub_metering_1,type='l',ylab='Energy sub metering'))
with(power,lines(Date_Time,Sub_metering_2,type='l',col='red'))
with(power,lines(Date_Time,Sub_metering_3,type='l',col='blue'))

legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'))
dev.off()