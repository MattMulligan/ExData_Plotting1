###READ IN DATA###
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, 
                   na.strings = "?",
                   colClasses = c("Global_active_power" = "numeric",
                                  "Global_reactive_power" = "numeric", 
                                  "Voltage" = "numeric", 
                                  "Global_intensity" = "numeric",
                                  "Sub_metering_1" = "numeric",
                                  "Sub_metering_2" = "numeric",
                                  "Sub_metering_3" = "numeric"))
unlink(temp)
rm(temp)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")





###OPEN PNG DEVCIE###
png("plot1.png", width = 480, height = 480)

####CREATE PLOT 1####
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency"
)

###CLOSE PNG DEVICE###
dev.off()