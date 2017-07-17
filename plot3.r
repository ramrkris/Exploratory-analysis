
library(dplyr)
library(lubridate)

# Read datasets and clean dates
  #setwd("C:/Users/rr5743/Projects/2017/Data Science/Exploratory analysis/Wk1")
  #powerdata <- read.table("household_power_consumption.txt", header =TRUE,sep=";",na.strings="?")
  #powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")

# Filter for Feb data
  #globalsubpowerFeb <- 
  #powerdata %>%
  #select(Date,Time, Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3) %>% 
  #filter(Date == "2007-02-01"|Date == "2007-02-02")
  
# Add a date time variable
  #globalsubpowerFeb <- mutate(globalsubpowerFeb,date_time = paste(globalsubpowerFeb$Date,globalsubpowerFeb$Time, Sep=" "))
  #globalsubpowerFeb$date_time <- as.POSIXct(strptime(globalsubpowerFeb$date_time, "%Y-%m-%d %H:%M:%S"))

#Plot the graph    
  with(globalsubpowerFeb,plot(Sub_metering_1,xaxt = "n",ylab ="Energy Sub Metering", xlab="", type="n"))
  with(globalsubpowerFeb,points(Sub_metering_1,xaxt = "n",type="l",col="black"))
  with(globalsubpowerFeb,points(Sub_metering_2,xaxt = "n",type="l",col="red"))
  with(globalsubpowerFeb,points(Sub_metering_3,xaxt = "n",type="l",col="blue"))
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  
  legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     