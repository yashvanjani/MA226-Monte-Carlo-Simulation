U<-runif(200000)
X<-vector("numeric")
for (i in 1:200000)
{
	if(U[i]<=0.4)
	{
		X[i]=-2*log(2*U[i])
	}
	else
	{
		X[i]=-3*log(3*U[i])
	}
}
cat("Mean = ",mean(X),"\n")
cat("Variance = ", var(X), "\n")
