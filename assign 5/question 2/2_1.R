f<-function(x1,x2)
{
	return(sqrt(-2*log(x1))*cos(2*pi*x2))
}
g<-function(x1,x2)
{
	return(sqrt(-2*log(x1))*sin(2*pi*x2))
}
p<-c(100,500,1000)
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
		z1[j]=sqrt(5)*f(u1[j],u2[j])
		z2[j]=(sqrt(5)*g(u1[j],u2[j]))+5
		j=j+1
	}
	cat("Mean of ",p[i],"numbers of z1 is ",mean(z1),"\n")
	cat("Mean of ",p[i],"numbers of z2 is ",mean(z2),"\n")
	cat("Variance of ",p[i],"numbers of z1 is ",var(z1),"\n")
	cat("Variance of ",p[i],"numbers of z2 is ",var(z2),"\n")
	#hist(z1,col="darkblue",main=paste("Normal Distribution(Z1) for n = ",p[i],"\nMean = ",mean(z1),"\nVariance = ",var(z1)),xlab="X",ylab="Frequency",breaks=p[i]/20)
	#hist(z2,col="darkblue",main=paste("Normal Distribution(Z2) for n = ",p[i],"\nMean = ",mean(z2),"\nVariance = ",var(z2)),xlab="X",ylab="Frequency",breaks=p[i]/20)

	if(p[i]==500)
	{
		xseq<-seq(-10,15,0.01);
		h=ecdf(z1)
		m=ecdf(z2)
	    cumulative<-pnorm(xseq,0,sqrt(5))
	    plot(xseq, cumulative, col="darkorange", xlab="", ylab="Cumulative Probability",type="l",lwd=2, cex=2, main="CDF of Mean = 0\n Variance = 5", cex.axis=.8) 
	lines(h,col="blue")

	cum<-pnorm(xseq,5,sqrt(5))
	plot(xseq, cum, col="darkorange", xlab="", ylab="Cumulative Probability",type="l",lwd=2, cex=2, main="CDF of Mean = 5\n Variance = 5", cex.axis=.8)
	lines(m,col="darkgreen") 
	}
}
