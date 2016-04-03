#r_B is cg(x) of acceptance-rejection method
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
#f is f(x) of acceptance-rejection method
f<-function(x,alpha)
{
	return(exp(-x)/gamma(alpha)*x^(alpha-1))
}
alpha<-0.4 # 0<alpha<=1
gamma_alpha<-gamma(alpha)
d<-0.07+(0.75*sqrt(1-alpha))
NoOfRand<-10000
gammadist<-vector("numeric")
j<-0
for (i in 1:NoOfRand) 
{
	u<-runif(1,min=0,max=(((d^alpha)/(alpha*gamma_alpha))+(exp(-d)*(d^(alpha-1))/gamma_alpha)))
	v<-runif(1)
	if(u<=((d^alpha)/(alpha*gamma_alpha)))
	{
		x<-(alpha*gamma_alpha*u)^(1/alpha)
	}
	else
	{
		x<-(-1)*log((((d^alpha)-(alpha*gamma_alpha*u))/(alpha*d^(alpha-1)))+(exp(-d)))
	}
	r=f(x,alpha)/r_B(x,alpha)
	if(v<=r)
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