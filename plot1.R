library(sqldf)

filename <- "household_power_consumption.txt"
df <- read.csv.sql(filename,
                  "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                  sep=";", header = TRUE,
                  colClasses = c("character", "character", rep("numeric", 7)))

png(file="plot1.png",width=480, height=480)
par(mfrow=c(1,1))
with(df, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power"))
                  
dev.off()