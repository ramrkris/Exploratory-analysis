
library(dplyr)

# Read datasets and clean dates
  setwd("C:/Users/rr5743/Projects/2017/Data Science/Exploratory analysis/Wk1")
  powerdata <- read.table("household_power_consumption.txt", header =TRUE,sep=";",na.strings="?")
  powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")

# Filter for Feb data and plot histogram
  globalpowerFeb <- powerdata %>%
  select(Date,Global_active_power) %>% filter(Date == "2007-02-01"|Date == "2007-02-02")
  hist(globalpowerFeb$Global_active_power,main = "Global Active Power", xlim = c(0,6),col="red",xlab="Global Active Power (kilowatts)")
  
