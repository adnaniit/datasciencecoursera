##Set the working directory
setwd("C:/Users/axh080/Documents/R/data")

##Read the File from WD, Set NA String as ?
UCIData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

##Exclude NA Rows
UCIData2<-na.omit(UCIData)

##Select Only 2007/02/01 and 2007/02/02 rows
UCIFeb<-UCIData2[UCIData2$Date %in% c("1/2/2007","2/2/2007") ,]

##Get the desired variable and type cast as datetime
datetime<-strptime(paste(UCIFeb$Date,UCIFeb$Time,Sep=" "),"%d/%m/%Y %H:%M:%S")

##Get the desired variable and type case as number
Global_active_power<-as.numeric(UCIFeb$Global_active_power)
Global_reactive_power<-as.numeric(UCIFeb$Global_reactive_power)
Voltage <- as.numeric(UCIFeb$Voltage)

##Get the sub metering variables as numbers
Sub_metering_1 <- as.numeric(UCIFeb$Sub_metering_1) 
Sub_metering_2 <- as.numeric(UCIFeb$Sub_metering_2) 
Sub_metering_3 <- as.numeric(UCIFeb$Sub_metering_3) 

##Plot as PNG
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, Sub_metering_2, type="l", col="red") 
lines(datetime, Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 

##Switch off device
dev.off()