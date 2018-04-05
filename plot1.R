##assuming that the txt file has been extracted in the working directory

power_consum <- read.table("household_power_consumption.txt",skip = 66637,nrows = 2880,header = FALSE,sep = ";",na.strings = "?")
colnames(power_consum) <- names(read.table("household_power_consumption.txt",nrows=5,header=TRUE,sep=";"))
power_consum$Date <- as.Date(power_consum$Date,format="%d/%m/%Y")
power_consum$datetime <- strptime(paste(power_consum$Date,power_consum$Time),format = "%Y-%m-%d %H:%M:%S")
png(file="plot1.png")
hist(power_consum$Global_active_power,col = "Red", xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()