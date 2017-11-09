electricpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = F, dec=".")
electricpower$Date<-strptime(electricpower$Date,"%d/%m/%Y")
electricpower1<-electricpower[electricpower$Date=="2007-02-01 IST"| electricpower$Date=="2007-02-02 IST",]
png("plot1.png",width=480, height=480)
hist(as.numeric(electricpower1$Global_active_power), col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power")

dev.off()                                

