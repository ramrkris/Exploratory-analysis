
library(dplyr)
library(lubridate)

# Read datasets and clean dates
  setwd("C:/Users/rr5743/Projects/2017/Data Science/Exploratory analysis/Wk1")
  powerdata <- read.table("household_power_consumption.txt", header =TRUE,sep=";",na.strings="?")
  powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")

# Filter for Feb data and plot histogram
  globalpowerFeb <- 
  powerdata %>%
  select(Date,Time, Global_active_power) %>% 
  filter(Date == "2007-02-01"|Date == "2007-02-02")
  
# Add a date time variable
  globalpowerFeb <- mutate(globalpowerFeb,date_time = paste(globalpowerFeb$Date,globalpowerFeb$Time, Sep=" "))
  head(globalpowerFeb)
  globalpowerFeb$date_time <- as.POSIXct(strptime(date_time, "%Y-%m-%d %H:%M:%S"))

#Plot the graph    
  with(globalpowerFeb,plot(Global_active_power,xaxt = "n",ylab ="Global Active Power (kilowatts)", xlab="", type="l"))
  axis(1,globalpowerFeb$date_time,format(globalpowerFeb$date_time, "%a"))
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
       