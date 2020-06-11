DT <- read.csv("~/DATA SCIENCE/household_power_consumption.txt", sep=";")
DT$Date <- as.Date(DT$Date,"%d/%m/%Y")
DT.filter<-DT[DT$Date=="2007-02-01" | DT$Date=="2007-02-02",]
DT.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)
rm(DT)

png(filename="1.png", width=480, height=480)
hist(DT.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()








