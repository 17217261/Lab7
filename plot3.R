DT <- read.csv("~/DATA SCIENCE/household_power_consumption.txt", sep=";")
DT$Date <- as.Date(DT$Date,"%d/%m/%Y")
DT.filter<-DT[DT$Date=="2007-02-01" | DT$Date=="2007-02-02",]
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)
DT.filter$Sub_metering_1<-as.numeric(DT.filter$Sub_metering_1)
DT.filter$Sub_metering_2<-as.numeric(DT.filter$Sub_metering_2)
DT.filter$Sub_metering_3<-as.numeric(DT.filter$Sub_metering_3)
with(DT.filter, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

