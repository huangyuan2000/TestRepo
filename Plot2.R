
## get data from the datafile,select data with Date from 1/2/2007 to 2/2/2007
edata<-read.csv2("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
edata=edata[which(edata$Date=='1/2/2007'|edata$Date=='2/2/2007'),]

#format the date and time, and Global_active_power to appropriate date/time and numeric data types
edata$Time=strptime(paste(edata$Date,edata$Time),"%d/%m/%Y %H:%M:%S")
edata$Date=as.Date(edata$Date,"%d/%m/%Y")
edata$Global_active_power=as.numeric(edata$Global_active_power)

#open the png device
png(filename="plot2.png",width=480,height=480,unit="px")

#draw the plot
with(edata,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#turn off the device
dev.off()