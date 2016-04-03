gammadist<-vector("numeric")
j<-0
NoOfRand<-10000
alpha<-0.4 # 0<alpha<=1
for(i in 1:NoOfRand)
{
	u<-runif(1)
	v<-runif(1)
	b<-(exp(1)+alpha)/exp(1)
	p<-b*u
	if(p>1) # case x>1
	{
		x<-(-1)*log((b-p)/alpha)
		if(v<=(x^(alpha-1)))
		{
			j<-j+1
			gammadist[j]=x
		}
	}
	else # case x<=1
	{
		x<-p^(1/alpha)
		if(v<=exp(-x))
		{
			j<-j+1
			gammadist[j]=x
		}
	}
}

acceptance_prob<-(j/NoOfRand)
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gammaAhrens.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()