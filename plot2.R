png(file = "plot2.png", bg = "transparent")
library("data.table")
filename <- "household_power_consumption.txt"
pow <- fread(filename, sep = ";", header = T, na.strings = "?")
subpow <- pow[pow[, Date == "1/2/2007" | Date == "2/2/2007"]]

time <- strptime(paste(subpow[["Date"]], subpow[["Time"]]), "%d/%m/%Y %H:%M:%S")
plot(time, subpow$Global_active_power, type = "l", xlab="", 
     ylab = "Global Active Power(killowatts)")
dev.off()