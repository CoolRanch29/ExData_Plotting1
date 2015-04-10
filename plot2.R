install.packages('graphics')
library('graphics')
png("plot2.png")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
logical <- (data[,1] == "2007-02-01" | data[,1] == "2007-02-02")
data <- data[logical,]
gap <- data$Global_active_power
gap <- as.numeric(levels(gap))[gap]
datetimes <- data[,c(1,2)]
datetimes <- paste(datetimes[,1], datetimes[,2])
datetimes <- strptime(datetimes, format = "%Y-%m-%d %T")
plot(datetimes, gap, type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()