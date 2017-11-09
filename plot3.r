electricpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F, dec=".")
electricpower$Date1<-strptime(electricpower$Date,"%d/%m/%Y")
electricpower1<-electricpower[electricpower$Date1=="2007-02-01 IST"| electricpower$Date1=="2007-02-02 IST",]
datetime<-strptime(paste(electricpower1$Date,electricpower1$Time, sep=""),"%d/%m/%Y%H:%M:%S")
png("plot3.png")

with(electricpower1, {
  
  plot(datetime,electricpower1$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
  lines(datetime,electricpower1$Sub_metering_2, type = "l", col = "red")
  lines(datetime,electricpower1$Sub_metering_3, type = "l", col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)
})

dev.off() 