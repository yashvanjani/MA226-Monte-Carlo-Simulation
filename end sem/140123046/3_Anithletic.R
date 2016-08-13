U<-runif(100)
V<-runif(100)
X<-vector("numeric")
Y<-vector("numeric")
Z<-vector("numeric")
A<-vector("numeric")
B<-vector("numeric")
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

for(i in 1:100)
{
	A[i]=-log(U[i])
}
k<-0
for(i in 1:100)
{
	if(V[i]<=(exp(A[i]-(A[i]*A[i]))/c))
	{
		k=k+1
		B[k]<-A[i]
	}
}
if(j<k)
{
	for(i in 1:j)
	{
		Z[i]=(Y[i]+B[i])/2
	}
	cat("Estimate of the integral is = ",(j/100),"\n")
	cat("Variance = ",var(Z),"\n")
	red<-100*(var(Y)-var(Z))/var(Y)
	cat("Percentage variance reduction = ",red,"\n")
}
if(j>=k)
{
	for(i in 1:k)
	{
		Z[i]=(Y[i]+B[i])/2
	}
	cat("Estimate of the integral is = ",(k/100),"\n")
	cat("Variance = ",var(Z),"\n")
	red<-100*(var(Y)-var(Z))/var(Y)
	cat("Percentage variance reduction = ",red,"\n")
}


