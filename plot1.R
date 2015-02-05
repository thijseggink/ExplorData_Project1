newproject <- read.table("project.txt", header = TRUE, sep = ";")
dateproject <- subset(newproject, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png")
par(mar=c(5.1,4.1,4.1,2.1))
hist(as.numeric(levels(dateproject[,3])[dateproject[,3]])
     
     ,main = "Global Active Power"
     ,col =  "red"
     ,xlab = "Global Active Power (kilowatts)"
     )
dev.off()