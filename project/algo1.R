noofrand <- 10000

u1 <- runif(noofrand, min=0, max=1)

# Generating Generalized Exponential distribution
alpha <- 0.5	#arbit
X <- -2*log(1-(u1^(1/alpha)))

u2 <- runif(noofrand, min=0, max=1)

# Generating Gamma distribution using Acceptance-Rejection Method
gammadist <- vector('numeric')
for(i in 1:noofrand) {
	val <- ( (X[i]^(alpha-1))*exp(-0.5*X[i]) )/( (2^(alpha-1)) * ((1-exp(-0.5*X[i]))^(alpha-1)) )
	if(u2[i] <= val) {
		gammadist <- c(gammadist, X[i])
	}
}
# print(length(X))
# print(length(gammadist))

acceptance_prob<-(length(gammadist)/length(X))
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gamma1.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()