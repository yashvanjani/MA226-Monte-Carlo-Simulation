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
	accepted<-array(0,p[i])
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
			accepted[j]=accepted[j]+1

		}
		j=j+1
	}
	cat("Number of values accepted for ",p[i],"numbers is ",sum(accepted),"\n")
	cat("Rejection probability =  ",1-(sum(accepted)/p[i]),"\n")

}