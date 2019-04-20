rm(list=ls())
graphics.off()

household_cons <- read.table('new_household_cons.txt', header=T,
                             colClasses=c('character',rep('numeric',7)))

household_cons$Time <- strptime(household_cons$Time, "%Y-%m-%d %H:%M:%S")

png('plot3.png', width=480, height=480)
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
dev.off()
