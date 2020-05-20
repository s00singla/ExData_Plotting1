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

#exporting the data as png format
png(file = "plot1.png", width = 480, height = 480)
hist(HHPC$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200))
dev.off()

