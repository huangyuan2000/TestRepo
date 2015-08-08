## get data from the datafile,select data with Date from 1/2/2007 to 2/2/2007
edata<-read.csv2("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
edata=edata[which(edata$Date=='1/2/2007'|edata$Date=='2/2/2007'),]

#format the date and time, and Global_active_power to appropriate date/time and numeric data types
edata$Time=strptime(paste(edata$Date,edata$Time),"%d/%m/%Y %H:%M:%S")
edata$Date=as.Date(edata$Date,"%d/%m/%Y")
edata$Global_active_power=as.numeric(edata$Global_active_power)

#open the png device
png(filename="plot4.png",width=480,height=480,unit="px")

#format the arrangement of the plots
par(mfrow=c(2,2))

#plot 1 and plot 2 for the first row
with(edata,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
with(edata,plot(Time,Voltage,xlab="datetime",ylab="Voltage",type="l"))

#plot 3, cloumn 1 of second row
with(edata,plot(Time,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(edata,lines(Time,Sub_metering_2,col="red"))
with(edata,lines(Time,Sub_metering_3,col="blue"))
legend("topright",cex=0.5,pt.cex=1,col=c("black","red","blue"),lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4, column 2 of second row
with(edata,plot(Time,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l"))

#close png device
dev.off()