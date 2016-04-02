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
alpha<-0.7 # arbitrary
NoOfRand<-10000
gammadist<-vector("numeric")
j<-0
for (i in 1:NoOfRand) 
{
	u<-runif(1)
	v<-runif(1)
	x<-(-1)*log(1-((u)^(1/alpha)))
	r=r_AD(x,alpha)
	if(v<=x)
	{
		j<-j+1
		gammadist[j]=x
	}
}

acceptance_prob<-(j/NoOfRand)
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gammaAthren&Dieter.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()