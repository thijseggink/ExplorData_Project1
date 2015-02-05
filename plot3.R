#Read Data and Subset to the respective Dates
newproject <- read.table("project.txt", header = TRUE, sep = ";", colClasses = 'character')
dateproject <- subset(newproject, newproject$Date == "1/2/2007" | newproject$Date == "2/2/2007")

#Merges Date and Time
dateproject$datetime <- paste(dateproject$Date, dateproject$Time)

#Change Time
dateproject$datetime <- strptime(dateproject$datetime, "%d/%m/%Y %H:%M:%S", tz="")
dateproject$datetime <- as.POSIXct(dateproject$datetime)

#Date 
dateproject$Date <- as.Date(dateproject$Date, "%d/%m/%Y")

#Plot
png("plot3.png")
plot(x = dateproject$datetime, 
     y = dateproject$Sub_metering_1,
     type = "l", 
     xlab ="", 
     ylab = "Energy sub metering" )
lines(dateproject$datetime,dateproject$Sub_metering_2, col = "red")
lines(dateproject$datetime,dateproject$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lty=c(1,1,1)
       ,col=c("Black", "Red", "Blue"))
dev.off()
