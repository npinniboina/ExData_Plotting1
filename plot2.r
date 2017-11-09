electricpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F, dec=".")
electricpower$Date1<-strptime(electricpower$Date,"%d/%m/%Y")
electricpower1<-electricpower[electricpower$Date1=="2007-02-01 IST"| electricpower$Date1=="2007-02-02 IST",]
datetime<-strptime(paste(electricpower1$Date,electricpower1$Time, sep=""),"%d/%m/%Y%H:%M:%S")
GlobalPowerActive<-as.numeric(electricpower1$Global_active_power)
png("plot2.png",width=480, height=480)
plot(datetime,GlobalPowerActive,type = "l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()    


