##Downloading & Reading Data

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file1 <- "exdata_data_household_power_consumption.zip"
file2 <- "household_power_consumption.txt"

if(!file.exists(file1))
{
  download.file(url, destfile = file1)
}

if(!file.exists(file2))
{
  unzip(file1)
}

##Reading whole data file
data <- read.csv(file2, na.strings = "?", header = TRUE, sep = ";")
##Subsetting data
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

##Merging date & time into a new column and 
##converting to DateTime format
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

##Making the plot
with(data, plot(DateTime, Sub_metering_1, xlab ="", 
                ylab = "Energy sub metering", type = "n"))
 points(data$DateTime, data$Sub_metering_1, col = "black", type = "l", lw = 1)
 points(data$DateTime, data$Sub_metering_2, col = "red", type = "l", lw = 1)
 points(data$DateTime, data$Sub_metering_3, col = "blue", type = "l", lw = 1)
 legend("topright", col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lw = 1, cex = 0.8)


##Saving to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
