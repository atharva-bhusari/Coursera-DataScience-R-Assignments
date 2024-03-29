#############Loading Data########################################
unzip("exdata_data_household_power_consumption.zip")

library("data.table")

powerData <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
powerData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
powerData <- powerData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width=480, height=480)

## Plot 1
hist(powerData[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
