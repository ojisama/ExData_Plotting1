png(file = "plot3.png", bg = "transparent")
library("data.table")
filename <- "household_power_consumption.txt"
pow <- fread(filename, sep = ";", header = T, na.strings = "?")
subpow <- pow[pow[, Date == "1/2/2007" | Date == "2/2/2007"]]

time <- strptime(paste(subpow[["Date"]], subpow[["Time"]]), "%d/%m/%Y %H:%M:%S")
plot(time, subpow$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(time, subpow$Sub_metering_2, col = "red")
lines(time, subpow$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
       "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()