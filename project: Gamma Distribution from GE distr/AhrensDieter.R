#r_AD is cg(x) of acceptance-rejection method
r_AD<-function(x,alpha)
{
	if(x<1)
	{
		return((alpha*exp(1)*(x^(alpha-1)))/(exp(1)+alpha))
	}
	else
	{
		return((alpha*exp(1-x))/(exp(1)+alpha))
	}
}
#f is f(x) of acceptance-rejection method
f<-function(x,alpha)
{
	return(exp(-x)/gamma(alpha)*x^(alpha-1))
}
alpha<-0.7 # arbitrary
gamma_alpha<-gamma(alpha)  #gamma(alpha) calculated for g(x), used gamma function predefined in R
NoOfRand<-10000
gammadist<-vector("numeric")
j<-0
for (i in 1:NoOfRand) 
{
	u<-runif(1,min=0,max=((1/(alpha*gamma_alpha))+(exp(-1)/gamma_alpha)))
	v<-runif(1,min=0,max=1)
	if(u<=(1/(alpha*gamma_alpha)))
	{
		x<-(alpha*gamma_alpha*u)^(1/alpha)
	}
	else
	{
		x<-(-1)*log(((1-(alpha*gamma_alpha*u))/(alpha))+(exp(-1)))
	}
	r=f(x,alpha)/r_AD(x,alpha) # r is f/cg
	if(v<=r)
	{
		j<-j+1
		gammadist[j]=x
	}
}

acceptance_prob<-(j/NoOfRand)
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gammaAhrensDieter.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()