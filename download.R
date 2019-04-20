download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile='power_consumption.zip',
              method='libcurl')

system('unzip power_consumption.zip')

household_cons <- read.table('household_power_consumption.txt',
                             header=T,
                             sep=';',
                             colClasses= c(rep('character',2),rep('numeric',7)),
                             na.strings='?')

selDates <- grep('^(1/2/2007|2/2/2007)', household_cons$Date)

household_cons <- household_cons[selDates,]

defDatesTimes <- paste(household_cons$Date, household_cons$Time)

newDatesTimes <- strptime(defDatesTimes, "%d/%m/%Y %H:%M:%S")

new_household_cons <- data.frame(Time=as.character(newDatesTimes), household_cons[,3:9])

write.table(new_household_cons, 'new_household_cons.txt', row.names=F)

system('rm household_power_consumption.txt')
