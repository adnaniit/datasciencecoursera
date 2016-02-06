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

##Plot as PNG
png("plot2.png",width=480,height=480)
plot(datetime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Switch off device
dev.off()