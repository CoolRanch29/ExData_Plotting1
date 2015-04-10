install.packages('graphics')
library('graphics')
png("plot1.png")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
logical <- (data[,1] == "2007-02-01" | data[,1] == "2007-02-02")
data <- data[logical,]
gap <- data$Global_active_power
gap <- as.numeric(levels(gap))[gap]
hist(gap, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()