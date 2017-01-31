
setwd("C:/Users/victo/Documents/Estudios/Coursera/Exploratory data analysis")

Taula<-read.csv2('./data/household_power_consumption.txt',header=T)
#Taula[,"Temps"]<-as.POSIXct(strptime(paste(Taula$Date, Taula$Time),format="%d/%m/%Y %H:%M:%S"))
Taula[,"Temps"]<-as.Date(Taula$Date,format="%d/%m/%Y")
TaulaF<-subset(Taula, Temps >= "2007/02/01" & Temps <= "2007/02/02")


#   Plot 3
png("plot3.png",width = 480, height = 480, units = "px")
plot(as.numeric(TaulaF$Sub_metering_1), type="l",xlab="",ylab="Energy sub metering", xaxt="n")
lines(as.numeric(TaulaF$Sub_metering_2)/2, col="red")
lines(as.numeric(TaulaF$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
dev.off()