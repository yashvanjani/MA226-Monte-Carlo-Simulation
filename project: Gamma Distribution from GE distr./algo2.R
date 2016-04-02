func_a<-function(x)
{
	return(((1-exp(-0.5))^x)/(((1-exp(-0.5))^x)+(x*exp(-1)/(2^x))))
}
func_b<-function(x)
{
	return(((1-exp(-0.5))^x)+(x*exp(-1)/(2^x)))
}
NoOfRand<-10000
alpha<-0.7 # arbitrary
a<-func_a(alpha)
b<-func_b(alpha)
j<-0
gammadist<-vector("numeric")
# x(u,alpha,lambda=1); x is value of majorization function
for(i in 1:NoOfRand)
{
	u<-runif(1) # u is 1st random number
	if(u<=a)
		{x<-(-2)*log(1-((u*b)^(1/alpha)))}
	else
		{x<-(-1)*log((2^alpha)/alpha*b*(1-u))}
	v<-runif(1) # v is 2nd random number
	if(x<=1)
	{
		#acceptance condition of x (generally being v<=f(x)/(c*g(x)))
		if(v<=(((x^(alpha-1))*exp(-x/2))/((2^(alpha-1))*((1-exp(-x/2))^(alpha-1)))))
		{
			j<-j+1
			gammadist[j]=x
		}
	}
	else
	{
		#acceptance condition of x (generally being v<=f(x)/(c*g(x)))
		if(v<=(x^(alpha-1)))
		{
			j<-j+1
			gammadist[j]=x
		}
	}
}
acceptance_prob<-(j/NoOfRand)
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gamma2.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()