m<-c(2^41,2^37,2^23,2^31,2^29);
a<-c(113,273,89,5,173);
b<-c(83,17,111,165,99);
x<-c(4,33,632,114,264);
E<-matrix(log(0.5),nrow=5000,ncol=5);
freq<-array(0,50);
u<-array(0,5);
for(j in 1:5)
{
	for(i in 1:5000)
	{
		x[j]<-(a[j]*x[j]+b[j])%%m[j];
		u[j]<-as.double(x[j])/m[j];
		if(u[j]<0.00001)
		{
			i<-i-1;
		}
		else
		{
			E[i,j]<- log(u[j]);
		}
	}
}
G<-array(0,5000);
for(i in 1:5000)
{
	G[i]<-sum(E[i,]);
	G[i]<- -0.2*G[i];
	e<-as.integer(G[i]*10);
	freq[e+1]<-freq[e+1]+1;
}
M<-mean(G);
max<-max(G);
min<-min(G);
cat("Max is:",max,"\n")
cat("min is:",min,"\n")
cat("mean is:",M,"\n")
barplot(freq);
