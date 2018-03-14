setwd('C:\\Users\\wengchiat-ng\\Documents\\R\\EDA-Assignment1\\ExData_Plotting1')
##stClass('myDate')
##setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))

data<-read.csv('household_power_consumption.txt',sep=';', colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')
data$Date.Time = strptime(paste(data$Date,data$Time),'%d/%m/%Y %T')

subData <- subset(data, Date.Time >= as.POSIXct('2007-02-01 0:00') & Date.Time < as.POSIXct('2007-02-03 0:00'))

with(subData,hist(x=Global_active_power,c='red',main='Global Active Power', xlab='Global Active Power (kilowatts)'))
 dev.copy(png,file='plot1.png')
dev.off()

with(subData,plot(type='l',y=Global_active_power,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))
dev.copy(png,file='plot2.png')
dev.off()

with(subData,plot(type='l',y=Sub_metering_1,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))
with(subData,lines(y=Sub_metering_2,x=Date.Time,col='red'))
with(subData,lines(y=Sub_metering_3,x=Date.Time,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),text.col=c('black','red','blue'))
dev.copy(png,file='plot3.png')
dev.off()

par(mfcol=c(2,2))
with(subData,plot(type='l',y=Global_active_power,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))

with(subData,plot(type='l',y=Sub_metering_1,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))
with(subData,lines(y=Sub_metering_2,x=Date.Time,col='red'))
with(subData,lines(y=Sub_metering_3,x=Date.Time,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),text.col=c('black','red','blue'))

with(subData,plot(type='l',y=Voltage,x=Date.Time, ylab='Voltage',xlab=''))
with(subData,plot(type='l',y=Global_reactive_power,x=Date.Time, ylab='Global Reactive Power (kilowatts)',xlab=''))
dev.copy(png,file='plot4.png')

