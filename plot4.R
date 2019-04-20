household_cons <- read.table('new_household_cons.txt', header=T,
                             colClasses=c('character',rep('numeric',7)))

household_cons$Time <- strptime(household_cons$Time, "%Y-%m-%d %H:%M:%S")

png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))

with(household_cons, plot(Time, Global_active_power,
                              ylab='Global Active Power',
                              xlab='', type='l'))
with(household_cons, plot(Time, Voltage,
                              ylab='Voltage',
                              xlab='datetime', type='l'))
with(household_cons,
{
    plot(Time, Sub_metering_1, type='l',
         ylab='Energy sub metering', xlab='')
    lines(Time,Sub_metering_2, col='red')
    lines(Time,Sub_metering_3, col='blue')
    legend('topright', lty=rep(1,3),
           col=c('black', 'red', 'blue'),
           legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
}
)
with(household_cons, plot(Time, Global_reactive_power,
                              ylab='Global_reactive_power',
                              xlab='datetime', type='l'))
dev.off()
