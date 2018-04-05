##assuming that the txt file has been extracted in the working directory

power_consum <- read.table("household_power_consumption.txt",skip = 66637,nrows = 2880,header = FALSE,sep = ";",na.strings = "?")
colnames(power_consum) <- names(read.table("household_power_consumption.txt",nrows=5,header=TRUE,sep=";"))
power_consum$Date <- as.Date(power_consum$Date,format="%d/%m/%Y")
power_consum$datetime <- strptime(paste(power_consum$Date,power_consum$Time),format = "%Y-%m-%d %H:%M:%S")
png(file="plot2.png")
plot(power_consum$datetime,power_consum$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()