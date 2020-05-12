library(sqldf)

filename <- "household_power_consumption.txt"
df <- read.csv.sql(filename,
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                   sep=";", header = TRUE,
                   colClasses = c("character", "character", rep("numeric", 7)))

df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
with(df,{
     plot(datetime, Global_active_power, type="l", 
          ylab="Global Active Power", xlab = NA)
     plot(datetime, Voltage, type="l", 
          ylab="Voltage")
     
     plot(datetime, Sub_metering_1, type="l", col="black",
          ylab="Energy sub metering", xlab = NA)
     points(datetime, Sub_metering_2, type="l", col="red")
     points(datetime, Sub_metering_3, type="l", col="blue")
     legend("topright", lty=1,
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"),
            bty = "n")
     
     plot(datetime, Global_reactive_power, type="l")
     })
dev.off()


