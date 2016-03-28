library(MASS)
a<-vector("numeric")
a[1]=-0.25
a[2]=0
a[3]=0.25
u<-vector("numeric")
u[1]=5
u[2]=8
E11=1
E12=2*a
E21=2*a
E22=4
Z1<-rnorm(1000)
Z2<-rnorm(1000)
X1<-vector("numeric")
X2<-vector("numeric")
for(j in 1:3)
{	for (i in 1:1000)
	{
		X1[i]=u[1]+Z1[i]
		X2[i]=u[2]+(2*a[j]*Z1[i])+(4*Z2[i])
	}
	g<-kde2d(X1,X2)
	contour(g)
	dev.copy(png,paste(j,".png"))
	dev.off()
	cat("For a = ",a[j],"\n")
	cat("The mean of X1 is ",mean(X1),"\n")
	cat("The mean of X2 is ",mean(X2),"\n")
	cat("The variance of X1 is ",var(X1),"\n")
	cat("The variance of X2 is ",var(X2),"\n")
	cat("The covariance is ",cov(X1,X2),"\n")
	cat("The correlation is ",cor(X1,X2),"\n")
	
}