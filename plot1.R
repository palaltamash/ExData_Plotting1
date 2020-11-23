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

##Making the plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

##Saving to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
