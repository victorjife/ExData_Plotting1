
setwd("C:/Users/victo/Documents/Estudios/Coursera/Exploratory data analysis")

Taula<-read.csv2('./data/household_power_consumption.txt',header=T)
#Taula[,"Temps"]<-as.POSIXct(strptime(paste(Taula$Date, Taula$Time),format="%d/%m/%Y %H:%M:%S"))
Taula[,"Temps"]<-as.Date(Taula$Date,format="%d/%m/%Y")
TaulaF<-subset(Taula, Temps >= "2007/02/01" & Temps <= "2007/02/02")


#   Plot 2
png("plot2.png",width = 480, height = 480, units = "px")
plot(as.numeric(TaulaF$Global_active_power)/500, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
dev.off()
