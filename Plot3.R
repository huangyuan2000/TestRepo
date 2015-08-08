## get data from the datafile,select data with Date from 1/2/2007 to 2/2/2007
edata<-read.csv2("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
edata=edata[which(edata$Date=='1/2/2007'|edata$Date=='2/2/2007'),]

#format the date and time to appropriate date/time and numeric data types
edata$Time=strptime(paste(edata$Date,edata$Time),"%d/%m/%Y %H:%M:%S")
edata$Date=as.Date(edata$Date,"%d/%m/%Y")

#open the png device
png(filename="plot3.png",width=480,height=480,unit="px")

#draw the line for Sub_metering_1,and add lines for Sub_metering_2 and Sub_metering_3
with(edata,plot(Time,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(edata,lines(Time,Sub_metering_2,col="red"))
with(edata,lines(Time,Sub_metering_3,col="blue"))

# add lengen
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#turn off the device
dev.off()