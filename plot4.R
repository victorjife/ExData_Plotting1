
setwd("C:/Users/victo/Documents/Estudios/Coursera/Exploratory data analysis")

Taula<-read.csv2('./data/household_power_consumption.txt',header=T)
#Taula[,"Temps"]<-as.POSIXct(strptime(paste(Taula$Date, Taula$Time),format="%d/%m/%Y %H:%M:%S"))
Taula[,"Temps"]<-as.Date(Taula$Date,format="%d/%m/%Y")
TaulaF<-subset(Taula, Temps >= "2007/02/01" & Temps <= "2007/02/02")

#   Plot 4
png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

# 1
plot(as.numeric(TaulaF$Global_active_power)/500, type="l", xaxt="n", ann=T, ylab="Global Active Power", xlab="")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))

# 2
plot(as.numeric(TaulaF$Voltage), type="l", ann=T, xaxt="n",yaxt="n",ylab="Voltage", xlab="datetime",)
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
axis(2, at=c(800,1200,1800,2200), labels= c(234,238,242,246))

# 3
plot(as.numeric(TaulaF$Sub_metering_1), type="l", xaxt="n",yaxt="n", ann=T, ylab="Energy sub metering", xlab="")
lines(as.numeric(TaulaF$Sub_metering_2)/2, col="red")
lines(as.numeric(TaulaF$Sub_metering_3), col="blue")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
legend("topright", col = c("black","red","blue"),lty=1,cex=0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4
plot(as.numeric(TaulaF$Global_reactive_power), type="l", xaxt="n",yaxt="n", ylab="Global_Reactive_power", xlab="datetime")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,50,100,150,200,250), labels= c(0.0,0.1,0.2,0.3,0.4,0.5), las=1, cex.axis=0.8)

dev.off()

