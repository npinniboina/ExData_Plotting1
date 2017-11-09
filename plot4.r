electricpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F, dec=".")
electricpower$Date1<-strptime(electricpower$Date,"%d/%m/%Y")
electricpower1<-electricpower[electricpower$Date1=="2007-02-01 IST"| electricpower$Date1=="2007-02-02 IST",]
datetime<-strptime(paste(electricpower1$Date,electricpower1$Time, sep=""),"%d/%m/%Y%H:%M:%S")
GlobalPowerActive<-as.numeric(electricpower1$Global_active_power)
globalreactivepower<-as.numeric(electricpower1$Global_reactive_power)
png("plot4.png", width=480,height=480)
par(mfrow=c(2,2))

plot(datetime,GlobalPowerActive,type = "l", xlab="", ylab="Global Active Power(kilowatts)")
plot(datetime,electricpower1$Voltage, type="l", xlab="datetime",ylab="Voltage")

with(electricpower1, {
  
  plot(datetime,electricpower1$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
  lines(datetime,electricpower1$Sub_metering_2, type = "l", col = "red")
  lines(datetime,electricpower1$Sub_metering_3, type = "l", col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1,lwd = 2,bty = "n")
})

plot(datetime,globalreactivepower, type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off()    
