f<-function(v1,v2)
{
	return(v1*sqrt(-2*log(v1^2+v2^2)/(v1^2+v2^2)))
}
g<-function(v1,v2)
{
	return(v2*sqrt(-2*log(v1^2+v2^2)/(v1^2+v2^2)))
}
p<-c(100,500,10000)
for(i in 1:3)
{
	v1<-2*runif(p[i])-1
	v2<-2*runif(p[i])-1
	j<-1
	k<-1
	z1<-vector("numeric")
	z2<-vector("numeric")
	while(j<=p[i])
	{
		if(v1[j]^2+v2[j]^2<1)
		{
			z1[k]<-f(v1[j],v2[j])
			z2[k]<-g(v1[j],v2[j])
			k=k+1
		}
		j=j+1
	}
	cat("Mean of ",p[i],"numbers of z1 is ",mean(z1),"\n")
	cat("Mean of ",p[i],"numbers of z2 is ",mean(z2),"\n")
	cat("Variance of ",p[i],"numbers of z1 is ",var(z1),"\n")
	cat("Variance of ",p[i],"numbers of z2 is ",var(z2),"\n")
	hist(z1,col="darkblue",main=paste("Normal Distribution(Z1) for n = ",p[i],"\nMean = ",mean(z1),"\nVariance = ",var(z1)),xlab="X",ylab="Frequency",breaks=p[i]/20)
	hist(z2,col="darkblue",main=paste("Normal Distribution(Z2) for n = ",p[i],"\nMean = ",mean(z2),"\nVariance = ",var(z2)),xlab="X",ylab="Frequency",breaks=p[i]/20)
}