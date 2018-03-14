setwd('C:\\Users\\wengchiat-ng\\Documents\\R\\EDA-Assignment1\\ExData_Plotting1')
data<-read.csv('household_power_consumption.txt',sep=';', colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')
data$Date.Time = strptime(paste(data$Date,data$Time),'%d/%m/%Y %T')

subData <- subset(data, Date.Time >= as.POSIXct('2007-02-01 0:00') & Date.Time < as.POSIXct('2007-02-03 0:00'))

par(mfcol=c(2,2))
with(subData,plot(type='l',y=Global_active_power,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))

with(subData,plot(type='l',y=Sub_metering_1,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))
with(subData,lines(y=Sub_metering_2,x=Date.Time,col='red'))
with(subData,lines(y=Sub_metering_3,x=Date.Time,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)

with(subData,plot(type='l',y=Voltage,x=Date.Time, ylab='Voltage',xlab=''))

with(subData,plot(type='l',y=Global_reactive_power,x=Date.Time, ylab='Global Reactive Power (kilowatts)',xlab=''))
dev.copy(png,file='plot4.png')
dev.off()
dev.off()