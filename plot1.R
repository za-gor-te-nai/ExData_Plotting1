rm(list=ls())
graphics.off()

household_cons <- read.table('new_household_cons.txt', header=T,
                             colClasses=c('character',rep('numeric',7)))

household_cons$Time <- strptime(household_cons$Time, "%Y-%m-%d %H:%M:%S")

png('plot1.png', width=480, height=480)
with(household_cons, hist(Global_active_power,
                          col='red',
                          main='Global Active Power',
                          xlab='Global Active Power (kilowatts)'))
dev.off()
