library(sqldf)

filename <- "household_power_consumption.txt"
df <- read.csv.sql(filename,
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                   sep=";", header = TRUE,
                   colClasses = c("character", "character", rep("numeric", 7)))

df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png",width=480, height=480)
par(mfrow=c(1,1))
with(df, plot(DateTime, Global_active_power, type="l", 
              ylab="Global Active Power (kilowatts)", xlab = NA))
dev.off()