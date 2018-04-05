##assuming that the txt file has been extracted in the working directory

power_consum <- read.table("household_power_consumption.txt",skip = 66637,nrows = 2880,header = FALSE,sep = ";",na.strings = "?")
colnames(power_consum) <- names(read.table("household_power_consumption.txt",nrows=5,header=TRUE,sep=";"))
power_consum$Date <- as.Date(power_consum$Date,format="%d/%m/%Y")
power_consum$datetime <- strptime(paste(power_consum$Date,power_consum$Time),format = "%Y-%m-%d %H:%M:%S")
png(file="plot3.png")
plot(power_consum$datetime,power_consum$Sub_metering_1,type = "l",xlab="",ylab = "Energy sub metering")
lines(power_consum$datetime,power_consum$Sub_metering_2,col='Red')
lines(power_consum$datetime,power_consum$Sub_metering_3,col='Blue')
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('Black','Red','Blue'))
dev.off()