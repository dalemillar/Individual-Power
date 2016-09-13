setwd("~/Coursera/Exploratory/Project1/ExData_Plotting1")
tidydata<-read.csv("household_power_consumption.txt",sep=";",
                   header=TRUE,na.strings="?",stringsAsFactors=FALSE)

library(dplyr)
library(lubridate)


tidydata$date_time = dmy_hms(paste(tidydata$Date,tidydata$Time))

tidydata<-select(tidydata,date_time,Global_active_power:Sub_metering_3)

tidydata<-filter(tidydata,year(date_time)=='2007', 
                 month(date_time)=='2',day(date_time)==1|day(date_time)==2)

hist(tidydata$Global_active_power,col='red',
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')

dev.copy(png,file="plot1.png")
dev.off()
