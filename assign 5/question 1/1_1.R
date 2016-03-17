f<-function(x1,x2)
{
	return(sqrt(-2*log(x1))*cos(2*pi*x2))
}
g<-function(x1,x2)
{
	return(sqrt(-2*log(x1))*sin(2*pi*x2))
}
p<-c(100,500,10000)
z1<-vector("numeric")
z2<-vector("numeric")
for( i in 1:3)
{
	z1<-vector("numeric")
	z2<-vector("numeric")
	u1<-runif(p[i])
	u2<-runif(p[i])
	j<-1
	while(j<=p[i])
	{
		z1[j]=f(u1[j],u2[j])
		z2[j]=g(u1[j],u2[j])
		j=j+1
	}
	cat("Mean of ",p[i],"numbers of z1 is ",mean(z1),"\n")
	cat("Mean of ",p[i],"numbers of z2 is ",mean(z2),"\n")
	cat("Variance of ",p[i],"numbers of z1 is ",var(z1),"\n")
	cat("Variance of ",p[i],"numbers of z2 is ",var(z2),"\n")
	hist(z1,col="darkblue",main=paste("Normal Distribution(Z1) for n = ",p[i],"\nMean = ",mean(z1),"\nVariance = ",var(z1)),xlab="X",ylab="Frequency",breaks=p[i]/20)
	hist(z2,col="darkblue",main=paste("Normal Distribution(Z2) for n = ",p[i],"\nMean = ",mean(z2),"\nVariance = ",var(z2)),xlab="X",ylab="Frequency",breaks=p[i]/20)

}
