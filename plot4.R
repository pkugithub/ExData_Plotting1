# plot2.R

# read and massage input data

df <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=F)
df2 <- df[ df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)
df2$Voltage <- as.numeric(df2$Voltage)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)

datetime <- strptime( do.call(paste, df2[c(1,2)]), format="%d/%m/%Y %H:%M:%S")
df_final <- cbind(datetime, df2)


# create png plot (multiple frames)

png(file="plot4.png")

par(mfcol = c (2,2))

# plot - global active power

plot(df_final$datetime, df_final$Global_active_power, type="l",
     xlab='', ylab='Global Active Power (kilowatts)')

# plot - sub metering

plot(df_final$datetime, df_final$Sub_metering_1, type="l", col='black',
     xlab='', ylab='Energy sub metering')
lines(df_final$datetime, df_final$Sub_metering_2, type="l", col='red')
lines(df_final$datetime, df_final$Sub_metering_3, type="l", col='blue')

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), lwd=c(2, 2, 2), bty='n', cex=0.7,
       col=c("black", "red", "blue"))

# plot - voltage

plot(df_final$datetime, df_final$Voltage, type="l",
     xlab='datetime', ylab='Voltage')

# plot - global reactive power

plot(df_final$datetime, df_final$Global_reactive_power, type="l",
     xlab='datetime', ylab='Global_reactive_power')

dev.off()

