# plot1.R

# read and massage input data

df <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=F)
df2 <- df[ df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
df2$Global_active_power <- as.numeric(df2$Global_active_power)

datetime <- strptime( do.call(paste, df2[c(1,2)]), format="%d/%m/%Y %H:%M:%S")
df_final <- cbind(datetime, df2)

# create png plot

png(file="plot1.png")

hist(df_final$Global_active_power, col='red', 
     main='Global Active Power', xlab='Global Active Power (killowatts)')

dev.off()
