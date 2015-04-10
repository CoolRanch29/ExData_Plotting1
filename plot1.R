data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
logical <- (data[,1] == "2007-02-01" | data[,1] == "2007-02-02")
data <- data[logical,]