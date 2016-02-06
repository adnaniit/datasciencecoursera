##Set the working directory
setwd("C:/Users/axh080/Documents/R/data")

##Read the File from WD, Set NA String as ?
UCIData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

##Exclude NA Rows
UCIData2<-na.omit(UCIData)

##Type Cast Date as Date to allow Date based exclusion
UCIData2$Date<-as.Date(UCIData2$Date,"%d/%m/%Y")

##Select only certain records that are from 2007-02-01 and 2007-02-02
UCIFeb<-UCIData2[which(UCIData2$Date >= "2007-02-01" & UCIData2$Date <= "2007-02-02"),]

##Get the desired variable and type case as number
Global_active_power<-as.numeric(UCIFeb$Global_active_power)

##Plot as PNG
png("plot1.png",width=480,height=480)
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

##Switch off device
dev.off()