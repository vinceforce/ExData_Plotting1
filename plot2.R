# For selecting only records wit given dates, without loading unuseful data
# Read the variables names
headers <- read.table(file = "household_power_consumption.txt", na.strings = "NA", nrows = 1,
                      sep = ";", stringsAsFactors = FALSE)
# Read the lines for data with date betxeen 2007-02-01 and 2007-02-02 
hpc <- read.table(file = "household_power_consumption.txt", na.strings = "NA", skip = 66644, nrows = 2880,
                  sep = ";", header = FALSE, as.is = rep(TRUE, 9))
# Retrieve variables names
names(hpc) <- headers

# Create new column giving POSIXlt date/time value
hpc$POSIXlt <- strptime(paste(hpc$Date, hpc$Time, sep = "T"), "%d/%m/%YT%T")

par(mfrow = c(1, 1))

# Generate graphic
plot(hpc$POSIXlt, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Copy graphic to PNG file (480 px * 480 px by default)
dev.copy(png, file = "plot2.png")
dev.off()