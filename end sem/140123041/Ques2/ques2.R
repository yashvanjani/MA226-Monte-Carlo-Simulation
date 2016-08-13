alpha <- 0.4
noofrand <- 200

# Exponential distribution with mean 2
exp2 <- -2*log(runif(noofrand, min=0, max=1))

# Exponential distribution with mean 3
exp3 <- -3*log(runif(noofrand, min=0, max=1))

mixed <- vector('numeric')

for(i in 1:noofrand) {
	if(runif(1,min=0,max=1) < alpha) {
		mixed <- c(mixed, exp2[i])
	}
	else {
		mixed <- c(mixed, exp3[i])
	}
}

png(file="exponential_2")
hist(exp2, col="red", breaks=20)
dev.off()

png(file="exponential_3")
hist(exp3, col="red", breaks=20)
dev.off()

png(file="mixed_distribution")
hist(mixed, col="red", breaks=20)
dev.off()
