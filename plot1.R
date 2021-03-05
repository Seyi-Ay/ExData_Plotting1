## The object of this assignment was to reproduce plots provided. 
## The overall goal is to examine how household energy usage varies over a 2-day period in February, 2007. 
## The task is aimed at reconstructing certain given plots, all of which were constructed using the base plotting system.

## reading in the data
Data1 <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, 
                        header = TRUE, sep =";", na.strings="?")
## subsetting the data over a 2-day period in February, 2007 
## (from the dates 2007-02-01 and 2007-02-02)
Data2 <- subset(Data1,Date == "1/2/2007" | Date == "2/2/2007")
## converting the Date variable to Date class
Data2$Date <- as.Date(Data2$Date,format="%d/%m/%Y")
## initializing the the file device
png("plot1.png", width=480, height=480)
## plotting to the file device
plot1 <- hist(Data2$Global_active_power,xlab="Gloal Active Power (kilowatts)",
              main="Global Active Power",col="red")
dev.off()
