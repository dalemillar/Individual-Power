setwd("~/Coursera/Exploratory/Project1/ExData_Plotting1")
tidydata<-read.csv("household_power_consumption.txt",sep=";",
                   header=TRUE,na.strings="?",stringsAsFactors=FALSE)

library(dplyr)
library(lubridate)


tidydata$date_time = dmy_hms(paste(tidydata$Date,tidydata$Time))

tidydata<-select(tidydata,date_time,Global_active_power:Sub_metering_3)

tidydata<-filter(tidydata,year(date_time)=='2007', 
                 month(date_time)=='2',day(date_time)==1|day(date_time)==2)

par(mar=c(2,4,2,2),mfrow =c(2,2))

plot(tidydata$date_time,tidydata$Global_active_power,type='l',
     ylab="Global Active Power",xlab='')

plot(tidydata$date_time,tidydata$Voltage,type='l',
     ylab="Voltage",xlab='datetime')

plot(tidydata$date_time,tidydata$Sub_metering_1,type='n',ylab="Energy sub metering",xlab='')
lines(tidydata$date_time,tidydata$Sub_metering_1,type='l')
lines(tidydata$date_time,tidydata$Sub_metering_2,type='l',col='red')
lines(tidydata$date_time,tidydata$Sub_metering_3,type='l',col='blue')

legend('topright',lty = 1,col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(tidydata$date_time,tidydata$Global_reactive_power,type='l',
     ylab="Global_reactive_power",xlab='datetime')

dev.copy(png,file="plot4.png")
dev.off()