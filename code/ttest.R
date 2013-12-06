setwd("C:/Users/Frank/Google Drive/scicomp_groupmeeting/run_length_data/")
data <- read.csv("input/speeds.csv")
summary(data)
t.test(data$X24GS, data$X208)

vel <- colMeans(data, na.rm=TRUE)
sd <- sapply(data, sd, na.rm=TRUE)
vel
sd

library(ggplot2)
ggplot() + 
  geom_bar(aes(x = names(vel), y = vel), stat='identity', alpha=0.7) +
  geom_errorbar(aes(x = names(vel), ymax = vel + sd, ymin = vel - sd))
qplot(names(vel), vel, geom='bar', stat='identity')
ggplot(data=data) + geom_histogram(aes(x=data$X208))

setwd("C:/Users/Frank/Google Drive/Python/ps5/")
load("ps5prob5.RData")
ggplot(data=data, aes(x = log(wavelength), y = flux)) + 
  geom_line(aes(colour=factor(time), group=time), size=1)