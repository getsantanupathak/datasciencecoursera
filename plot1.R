electric_power_consumption <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
subset_epc <- electric_power_consumption[(as.Date(electric_power_consumption$Date,"%d/%m/%Y") >= as.Date('01/02/2007',"%d/%m/%Y") & as.Date(electric_power_consumption$Date,"%d/%m/%Y") <= as.Date('02/02/2007',"%d/%m/%Y")),]
png(filename="plot1.png",width=480,height=480, units = "px")
hist(subset_epc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()