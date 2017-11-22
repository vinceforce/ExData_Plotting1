# For selecting only records wit given dates, without loading unuseful data
# Read the variables names
headers <- read.table(file = "household_power_consumption.txt", na.strings = "NA", nrows = 1,
                      sep = ";", stringsAsFactors = FALSE)
# Read the lines for data with date betxeen 2007-02-01 and 2007-02-02 
hpc <- read.table(file = "household_power_consumption.txt", na.strings = "NA", skip = 66644, nrows = 2880,
                  sep = ";", header = FALSE, as.is = rep(TRUE, 9))
# Retrieve variables names
names(hpc) <- headers

gap <- hpc$Global_active_power
# Eliminate NAS and outliers
gap <- gap[!is.na(gap) & gap <= 7.0]
par(mfrow = c(1, 1))
# Build the graphic in 3 steps
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     breaks = 12, right = TRUE, xlim = c(0, 7), ylim = c(0, 1200), axes = FALSE)
axis(side = 1, at = c(0, 2, 4, 6))
axis(side = 2, at = c(0, 200, 400, 600, 800, 1000, 1200))

# Copy graphic to PNG file (480 px * 480 px by default)
dev.copy(png, file = "plot1.png")
dev.off()
