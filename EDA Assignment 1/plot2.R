##import data
household_power_consumption <- rio::import('household_power_consumption.txt')
HHPC_Data <- household_power_consumption

#Convert date variable
HHPC_Data$Date<- as.Date(HHPC_Data$Date,'%d/%m/%Y')

#subset data as per given dates date
library(dplyr)
start <- as.Date('01-02-2007','%d-%m-%Y')
end <- as.Date('02-02-2007','%d-%m-%Y')
HHPC <- HHPC_Data %>% 
  filter(Date>=start) %>% 
  filter(Date<=end)

#creating a date time variable
HHPC$DateTime <- strptime(paste(HHPC$Date,HHPC$Time),"%Y-%m-%d %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480)
with(HHPC,plot(DateTime, Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab=''))
dev.off()
