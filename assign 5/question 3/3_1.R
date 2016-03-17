f<-function(x1,x2)
{
	return(sqrt(-2*log(x1))*cos(2*pi*x2))
}
g<-function(x1,x2)
{
	return(sqrt(-2*log(x1))*sin(2*pi*x2))
}
p<-c(10^3,10^4,10^5)
z1<-vector("numeric")
z2<-vector("numeric")
for( i in 1:3)
{
	ptm<-proc.time()
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
	cat("\n For n = ",p[i],"The time taken by Box muller method\n")
	print(proc.time() - ptm)

}
