install.packages('graphics')
library('graphics')
png("plot3.png")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
logical <- (data[,1] == "2007-02-01" | data[,1] == "2007-02-02")
data <- data[logical,]
datetimes <- data[,c(1,2)]
datetimes <- paste(datetimes[,1], datetimes[,2])
datetimes <- strptime(datetimes, format = "%Y-%m-%d %T")
sm1 <- data$Sub_metering_1
sm1 <- as.numeric(levels(sm1))[sm1]
sm2 <- data$Sub_metering_2
sm2 <- as.numeric(levels(sm2))[sm2]
sm3 <- data$Sub_metering_3
plot(datetimes, sm1, type = 'n', xlab = "", ylab = "Energy sub metering")
points(datetimes, sm1, type = 'l')
points(datetimes, sm2, type = 'l', col = 'red')
points(datetimes, sm3, type = 'l', col = 'blue')
legend("topright", legend = c("Sub_metering_1", 
                              "Sub_metering_2", 
                              "Sub_metering_3"), 
       lwd = 2, col = c("black", "red", "blue"))
dev.off()
