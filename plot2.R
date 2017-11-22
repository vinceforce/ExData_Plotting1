headers <- read.table(file = "household_power_consumption.txt", na.strings = "NA", nrows = 1,
                      sep = ";", stringsAsFactors = FALSE)
hpc <- read.table(file = "household_power_consumption.txt", na.strings = "NA", skip = 66644, nrows = 2880,
                  sep = ";", header = FALSE, as.is = rep(TRUE, 9))
names(hpc) <- headers

hpc$POSIXlt <- strptime(paste(hpc$Date, hpc$Time, sep = "T"), "%d/%m/%YT%T")

par(mfrow = c(1, 1))

plot(hpc$POSIXlt, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()