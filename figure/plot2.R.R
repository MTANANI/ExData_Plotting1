# Reading data into R from the current working directory
data=read.table("household_power_consumption.txt",header=T,sep=";")

# Subsetting the data to create new one that contains the dates from 2007-02-01 to 2007-02-02 
pos1=which(data[,1]=="1/2/2007"); pos1=pos1[1]; pos1
pos2=which(data[,1]=="2/2/2007"); pos2=pos2[length(pos2)]; pos2
data=data[pos1:pos2,]

# Converting the Date column from chr to date 
data$Date=as.Date(data$Date,"%d/%m/%Y")

# Converting the Time column from chr to time 
library(hms)
data$Time=as_hms(data$Time)

# Converting the other columns from chr to num
for(i in 3:ncol(data)){data[,i]=as.numeric(data[,i])}

# Plot2
png(file="plot2.png",width=480,height=480)
plot(ymd(data$Date)+hms(data$Time),data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
