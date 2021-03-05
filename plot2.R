## The object of this assignment was to reproduce plots provided. 
## The overall goal is to examine how household energy usage varies over a 2-day period in February, 2007. 
## The task is aimed at reconstructing certain given plots, all of which were constructed using the base plotting system.

## reading in the data
Data1 <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, 
                    header = TRUE, sep =";", na.strings="?")
## subsetting the data over a 2-day period in February, 2007 
## (from the dates 2007-02-01 and 2007-02-02)
Data2 <- subset(Data1,Date == "1/2/2007" | Date == "2/2/2007")
## convert the Date and Time variables to Date and Time classes
Date_time <- paste(Data2$Date, Data2$Time)
Data2$Date_time <- strptime(Date_time,"%d/%m/%Y %H:%M:%S")
Data2$Date_time <- as.POSIXct(Data2$Date_time)
## Plot 2
png("plot2.png", width=480, height=480)
with(Data2,{
  plot(Global_active_power~Date_time,type="l",
       ylab = "Global Active power (kilowatts)", xlab="")
})
dev.off()