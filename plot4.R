#Global_active_power vs days of week
#Voltage vs days of week (Date time)
#Energy_Sub_metering_1 2 3 vs days of week
#Global_reactive_power vs days of week (date time)


#Sub_metering_1, 2, 3 vs Days of Week
setwd("C:/git/Coursera_EDA")

#Plot 2 Global_active_power vs datetime
require(data.table)
data=fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

df <- subset(data, (data$Date=="1/2/2007") | (data$Date=="2/2/2007"))

#2 combine both date and time for plotting continuous data
df$datetime <- paste(df$Date, df$Time)

#3 this converts the format to data frame.
df <- as.data.frame(df)

#4 format to datetime column 
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S", tz= "")

#5 format the Date column
df$Date <- as.Date(df$Date, "%d/%m/%Y")

png("plot4.png", width=480, height=480, units="px")
old.par <- par(mfrow=c(2, 2))
#Plot (1,1)
plot(df$datetime, df$Global_active_power, type ="l", ylab="Global Active Power", xlab="")

#plot (1,2)
plot(df$datetime, df$Voltage, type ="l", ylab="Voltage", xlab="datetime")


#Plot (2,1)
plot(df$datetime, as.numeric(df$Sub_metering_1), type ="l", ylab="Energy sub metering", xlab="", col="black")
lines(df$datetime, as.numeric(df$Sub_metering_2), col="red")
lines(df$datetime, as.numeric(df$Sub_metering_3), col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)

#Plot (2,2)
plot(df$datetime, df$Global_reactive_power, type ="l", ylab="Global reactive Power", xlab="datetime")
par(old.par)
dev.off()