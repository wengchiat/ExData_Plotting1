setwd('C:\\Users\\wengchiat-ng\\Documents\\R\\EDA-Assignment1\\ExData_Plotting1')
data<-read.csv('household_power_consumption.txt',sep=';', colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')
data$Date.Time = strptime(paste(data$Date,data$Time),'%d/%m/%Y %T')

subData <- subset(data, Date.Time >= as.POSIXct('2007-02-01 0:00') & Date.Time < as.POSIXct('2007-02-03 0:00'))

with(subData,plot(type='l',y=Global_active_power,x=Date.Time, ylab='Global Active Power (kilowatts)',xlab=''))
dev.copy(png,file='plot2.png')
dev.off()
dev.off()
