setwd('~/Documentos/coursera/ExData_Plotting1/')
if(!file.exists('household_power_consumption.zip')){
  download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip', method = 'curl')
}
fulldata<-read.table(unz('household_power_consumption.zip',"household_power_consumption.txt"),header = T,sep = ";",na.strings = c("?"))
fulldata$DateTime<-strptime(paste(fulldata$Date,fulldata$Time,sep = ' '),"%d/%m/%Y %H:%M:%S")
#fulldata$Date<-strptime(fulldata$Date,"%d/%m/%Y")
data<-subset(fulldata,
  DateTime >= '2007-02-01 00:00:00' & 
  DateTime <= '2007-02-02 23:59:59'
)
png(file="plot1.png", width=504, height=504)
par(mfrow=c(1,1))
hist(data$Global_active_power, 
     col='red', 
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power'
)
dev.off()