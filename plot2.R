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
png("plot2.png")
plot(x = dateproject$datetime, 
     y = dateproject$Global_active_power, 
     type = "l", 
     xlab ="", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
