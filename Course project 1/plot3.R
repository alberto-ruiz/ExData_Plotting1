
setwd('//192.168.1.27/Alberto/Cursos/Exploratory Data Analysis/Proyecto 1')

base<-read.table('household_power_consumption.txt',sep=';',header=T,dec='.', na.strings = "?",
                 stringsAsFactors =F)

base1<-base  ## Respaldo de la base

base$Date2<-strptime(paste(base$Date,base$Time,sep=' '),format="%d/%m/%Y %H:%M:%S")  ### Cambio a formato fecha

base1<-base  ## Respaldo de la base

base2<-base[base$Date=='1/2/2007' | base$Date=='2/2/2007',]  ### Subset requerido

summary(base2$Date2)   # check del subset


png(filename = "plot3.png",width = 480, height = 480)
  plot(base2$Date2,base2$Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
  lines(base2$Date2,base2$Sub_metering_2,type='l',col='red')
  lines(base2$Date2,base2$Sub_metering_3,type='l',col='blue')
  legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         col=c('black','red','blue'),lty = c(1, 1, 1))
dev.off()




