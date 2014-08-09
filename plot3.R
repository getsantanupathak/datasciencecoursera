electric_power_consumption <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
subset_epc <- electric_power_consumption[(as.Date(electric_power_consumption$Date,"%d/%m/%Y") >= as.Date('01/02/2007',"%d/%m/%Y") & as.Date(electric_power_consumption$Date,"%d/%m/%Y") <= as.Date('02/02/2007',"%d/%m/%Y")),]
subset_epc_merged <- within(subset_epc, DateTime <- paste(Date,Time,sep=" "))
png(filename="plot3.png",width=480,height=480, units = "px")
plot(strptime(subset_epc_merged$DateTime,"%d/%m/%Y %H:%M:%S"),subset_epc_merged$Sub_metering_1,type="l", xlab="Time",ylab="Energy Sub Metering")
lines(strptime(subset_epc_merged$DateTime,"%d/%m/%Y %H:%M:%S"),subset_epc_merged$Sub_metering_2,col="red")
lines(strptime(subset_epc_merged$DateTime,"%d/%m/%Y %H:%M:%S"),subset_epc_merged$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()
