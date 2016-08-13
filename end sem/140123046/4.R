n<-5000
U1<-runif(n)
U2<-runif(n)
Z1<-vector("numeric")
Z2<-vector("numeric")
for(i in 1:n)
{
	R<--2*log(U1[i])
	V<-2*pi*U2[i]
	Z1[i]=sqrt(R)*cos(V)
	Z2[i]=sqrt(R)*sin(V)
}
hist(Z1)
hist(Z2)
