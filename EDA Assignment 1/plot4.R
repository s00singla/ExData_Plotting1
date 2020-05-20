##import data
household_power_consumption <- rio::import('household_power_consumption.txt')
HHPC_Data <- household_power_consumption

#Convert date variable
HHPC_Data$Date<- as.Date(HHPC_Data$Date,'%d/%m/%Y')
par(bg='white')
#subset data as per given dates date
library(dplyr)
start <- as.Date('01-02-2007','%d-%m-%Y')
end <- as.Date('02-02-2007','%d-%m-%Y')
HHPC <- HHPC_Data %>% 
  filter(Date>=start) %>% 
  filter(Date<=end)

#creating a date time variable
HHPC$DateTime <- strptime(paste(HHPC$Date,HHPC$Time),"%Y-%m-%d %H:%M:%S")
png(file = "plot4a.png", width = 480, height = 480)
par(mfcol=c(2,2))
#plot1 DateTime and Global_active_power
with(HHPC,plot(DateTime, Global_active_power,type="l",
               ylab="Global Active Power",xlab=''))

#plot2 DateTime and Sub_metering
plot(HHPC$DateTime, HHPC$Sub_metering_1,ylab="Energy sub metering",xlab="", type = 'l')
lines(HHPC$DateTime, HHPC$Sub_metering_2, col = 'red')
lines(HHPC$DateTime, HHPC$Sub_metering_3, col = 'blue')
legend('topright', lty=1, col = c("black", "red", "blue"), bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),y.intersp=0.8)
#plot3 DateTime and Global_reactive_power
with(HHPC,plot(DateTime, Global_reactive_power,type="l"))
length(HHPC$DateTime)-200
HHPC$DateTime[2680]
#plot4 DateTime and Voltage
with(HHPC,plot(DateTime, Voltage,type="l"))
dev.off()
