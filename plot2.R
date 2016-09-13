setwd("~/Coursera/Exploratory/Project1/ExData_Plotting1")
tidydata<-read.csv("household_power_consumption.txt",sep=";",
                   header=TRUE,na.strings="?",stringsAsFactors=FALSE)

library(dplyr)
library(lubridate)


tidydata$date_time = dmy_hms(paste(tidydata$Date,tidydata$Time))

tidydata<-select(tidydata,date_time,Global_active_power:Sub_metering_3)

tidydata<-filter(tidydata,year(date_time)=='2007', 
                 month(date_time)=='2',day(date_time)==1|day(date_time)==2)

par(mar=c(2,5,2,2))
plot(tidydata$date_time,tidydata$Global_active_power,type='l',
     ylab="Global Active Power (kilowatts)",xlab='')

dev.copy(png,file="plot2.png")
dev.off()

