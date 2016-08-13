# Naive Monte Carlo method
montecarlo <- function(n, num_estimates) {
	estimates <- vector(length=num_estimates)
	for(i in 1:num_estimates) {
		u <- runif(n, min=0, max=1)
		y <- 2*exp(-4*u*u)
		estimates[i] <- mean(y)
	}
	return(c(mean(estimates), var(estimates)))
}

# Antithetic estimate method
antithetic <- function(n, num_estimates) {
	estimates <- vector(length=num_estimates)
	for(i in 1:num_estimates) {
		u <- runif(n, min=0, max=1)
		v <- 1-u
		y1 <- 2*exp(-4*u*u)
		y2 <- 2*exp(-4*v*v)
		y <- (y1+y2)/2
		estimates[i] <- mean(y)
	}
	return(c(mean(estimates), var(estimates)))
}

# Control variate method
controlvariate <- function(n, num_estimates) {
	estimates <- vector(length=num_estimates)
	for(i in 1:num_estimates) {
		u <- runif(n,min=0,max=1)
		x <- 2*exp(-4*u*u)
		y <- 2*exp(-2*runif(n,min=0,max=1))
		c <- -1*cov(x,y)/var(y)

		w <- x + c*(y - mean(y))
		estimates[i] <- mean(w)
	}
	return(c(mean(estimates), var(estimates)))
}

N <- c(100,1000,10000)
num_estimates <- 100

naive_mean <- vector(length=length(N))
naive_var <- vector(length=length(N))
anti_mean <- vector(length=length(N))
anti_var <- vector(length=length(N))
control_mean <- vector(length=length(N))
control_var <- vector(length=length(N))

for(i in 1:length(N)) {
	naive_mean[i] <- montecarlo(N[i], num_estimates)[1]
	naive_var[i] <- montecarlo(N[i], num_estimates)[2]
	anti_mean[i] <- antithetic(N[i], num_estimates)[1]
	anti_var[i] <- antithetic(N[i], num_estimates)[2]
	control_mean[i] <- controlvariate(N[i], num_estimates)[1]
	control_var[i] <- controlvariate(N[i], num_estimates)[2]
}

for(i in 1:length(N)) {
	cat("For N =", N[i],"\n")
	cat("Naive Monte Carlo: \n")
	cat("mean =",naive_mean[i],"\n")
	cat("variance =",naive_var[i],"\n")

	cat("Antithetic Estimate: \n")
	cat("mean =",anti_mean[i],"\n")
	cat("variance =",anti_var[i],"\n")
	red1 <- 100*(naive_var[i] - anti_var[i])/naive_var[i]
	cat("Variance reduction =",red1,"\n")

	cat("Control Variate: \n")
	cat("mean =",control_mean[i],"\n")
	cat("variance =",control_var[i],"\n")
	red2 <- 100*(naive_var[i] - control_var[i])/naive_var[i]
	cat("Variance reduction =",red2,"\n")
	cat("\n")
}

