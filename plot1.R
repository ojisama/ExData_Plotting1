png(file = "plot1.png", bg = "transparent")
library("data.table")
filename <- "household_power_consumption.txt"
pow <- fread(filename, sep = ";", header = T, na.strings = "?")
subpow <- pow[pow[, Date == "1/2/2007" | Date == "2/2/2007"]]

subpow$Global_active_power <- as.numeric(subpow$Global_active_power)
hist(subpow$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(killowatts)")
dev.off()