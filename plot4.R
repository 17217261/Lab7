DT <- read.csv("~/DATA SCIENCE/household_power_consumption.txt", sep=";")
DT$Date <- as.Date(DT$Date,"%d/%m/%Y")
DT.filter<-DT[DT$Date=="2007-02-01" | DT$Date=="2007-02-02",]
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)
DT.filter$Global_reactive_power<-as.numeric(DT.filter$Global_reactive_power)
DT.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)
DT.filter$Voltage<-as.numeric(DT.filter$Voltage)
DT.filter$Sub_metering_1<-as.numeric(DT.filter$Sub_metering_1)
DT.filter$Sub_metering_2<-as.numeric(DT.filter$Sub_metering_2)
DT.filter$Sub_metering_3<-as.numeric(DT.filter$Sub_metering_3)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(DT.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})
