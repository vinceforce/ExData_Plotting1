headers <- read.table(file = "household_power_consumption.txt", na.strings = "NA", nrows = 1,
                  sep = ";", stringsAsFactors = FALSE)
hpc <- read.table(file = "household_power_consumption.txt", na.strings = "NA", skip = 66644, nrows = 2880,
                sep = ";", header = FALSE, as.is = rep(TRUE, 9))
names(hpc) <- headers

hpc$POSIXlt <- strptime(paste(hpc$Date, hpc$Time, sep = "T"), "%d/%m/%YT%T")

par(mfrow = c(2, 2))

plot(hpc$POSIXlt, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

plot(hpc$POSIXlt, hpc$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(hpc$POSIXlt, hpc$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
points(hpc$POSIXlt, hpc$Sub_metering_2, type="l", xlab = "", ylab = "", col = "red")
points(hpc$POSIXlt, hpc$Sub_metering_3, type="l", xlab = "", ylab = "", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",
       cex = 1)

plot(hpc$POSIXlt, hpc$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()