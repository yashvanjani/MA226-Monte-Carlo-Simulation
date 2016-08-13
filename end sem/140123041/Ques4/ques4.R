# Box-Muller to generate normal distribution
boxmuller <- function(n) {
	R <- -2*log(runif(n,min=0,max=1))
	u <- runif(n,min=0,max=1)
	u <- 2*pi*u
	x <- sqrt(R)*cos(u)
	return(x)
}

t <- seq(from=0,to=5,length.out=5000)

mu <- 0.2
sig <- 0.1

s5 <- vector(length=10)

#Generating Geometric Brownian Motion
png(file="gbm.png")
for(n in 1:10) {
	s <- vector(length=5000)
	s[1] <- 100
	for(i in 2:5000) {
		s[i] <- s[i-1]*exp((mu - 0.5*sig*sig)*(t[i]-t[i-1]) + sig*sqrt(t[i]-t[i-1])*boxmuller(1))
	}
	s5[n] <- s[5000]
	plot(s, type="l", col=colors()[as.integer(runif(1)*100)], ylim=c(100-100,100+100))
	par(new=TRUE)
}

s5meanth <- s[1]*exp(mu*5)
s5varth <- s[1]*s[1]*exp(mu*5)*exp(mu*5)*(exp(sig*sig*5)-1)

cat("Simulated E(S(5)) =", mean(s5), "\n")
cat("Simulated Var(S(5)) =", var(s5), "\n")
cat("Theoretical E(S(5)) =", s5meanth, "\n")
cat("Theoretical Var(S(5)) =", s5varth, "\n")
