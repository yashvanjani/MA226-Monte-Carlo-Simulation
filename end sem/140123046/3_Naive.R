U<-runif(100)
V<-runif(100)
X<-vector("numeric")
Y<-vector("numeric")
for(i in 1:100)
{
	X[i]=-log(1-U[i])
}
c<-exp(0.25)
j<-0
for(i in 1:100)
{
	if(V[i]<=(exp(X[i]-(X[i]*X[i]))/c))
	{
		j=j+1
		Y[j]<-X[i]
	}
}
cat("Estimate of the integral is = ",(j/100),"\n")
cat("Variance = ",var(Y),"\n")
