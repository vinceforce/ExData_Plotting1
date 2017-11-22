headers <- read.table(file = "household_power_consumption.txt", na.strings = "NA", nrows = 1,
                      sep = ";", stringsAsFactors = FALSE)
hpc <- read.table(file = "household_power_consumption.txt", na.strings = "NA", skip = 66644, nrows = 2880,
                  sep = ";", header = FALSE, as.is = rep(TRUE, 9))
names(hpc) <- headers

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
gap <- hpc$Global_active_power
gap <- gap[!is.na(gap) & gap <= 7.0]
par(mfrow = c(1, 1))
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     breaks = 12, right = TRUE, xlim = c(0, 7), ylim = c(0, 1200), axes = FALSE)
axis(side = 1, at = c(0, 2, 4, 6))
axis(side = 2, at = c(0, 200, 400, 600, 800, 1000, 1200))

dev.copy(png, file = "plot1.png")
dev.off()
