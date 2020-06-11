DT <- read.csv("~/DATA SCIENCE/household_power_consumption.txt", sep=";")
DT$Date <- as.Date(DT$Date,"%d/%m/%Y")
DT.filter<-DT[DT$Date=="2007-02-01" | DT$Date=="2007-02-02",]
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)
DT.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)
plot(DT.filter$Global_active_power~DT.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="2.1.png", height=480, width=480)



