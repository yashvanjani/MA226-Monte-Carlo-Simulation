r_B<-function(x,alpha)
{
	d<-0.07+(0.75*sqrt(1-alpha))
	b<-1+(exp(-d)*alpha/d)
	if(x<d)
	{
		return((alpha*(x^(alpha-1)))/(b*(d^alpha)))
	}
	else
	{
		return((alpha*exp(-x))/(b*d))
	}
}
alpha<-0.7 # arbitrary
d<-0.07+(0.75*sqrt(1-alpha))
NoOfRand<-10000
gammadist<-vector("numeric")
j<-0
for (i in 1:NoOfRand) 
{
	u<-runif(1)
	v<-runif(1)
	x<-(-1)*log(1-((u)^(1/alpha)))
	r=r_B(x,alpha)
	if(v<=x)
	{
		j<-j+1
		gammadist[j]=x
	}
}

acceptance_prob<-(j/NoOfRand)
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gammaBest.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()