setwd("C:/git/Coursera_EDA")

#Plot 1 Global_active_power vs Frequency
require(data.table)
data=fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

df <- subset(data, (data$Date=="1/2/2007") | (data$Date=="2/2/2007"))

#df.project$Date <- as.Date(df.project$Date, format = "%d/%m/%Y", tz="") 

#2 combine both date and time for plotting continuous data
df$datetime <- paste(df$Date, df$Time)
class(df)


#3 this converts the format to data frame.
df <- as.data.frame(df)
class(df)

#4 format to datetime column 
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S", tz= "")

#5 format the Date column, if the plotting doesn't need continuous data
df$Date <- as.Date(df$Date, "%d/%m/%Y")

png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(df$Global_active_power), xlab="Global Active Power(kilowatts", ylab="Frequency", main="Global Active Power", col="green")
dev.off()

