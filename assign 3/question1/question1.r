m<-2^15
a<-167
b<-59
x<-23
E<-array(0,5000)
freq<-array(0,35)
for(i in 1:5000)
{
	x<-(a*x+b)%%m
	u<-as.double(x)/m
	if(u<0.0001)
	{
		i<-i-1;
	}
	else
	{
		E[i]<- -5*log(u)
		e<- as.integer(E[i])
		freq[e]=freq[e]+1
	}
}
mean=mean(E)
min=min(E)
max=max(E)
cat("Max is:",max,"\n")
cat("min is:",min,"\n")
cat("mean is:",mean,"\n")
barplot(freq,main="X ~ Exp(1/5)", xlab="X",ylab="Frequency",xlim=c(0,40),ylim=c(0,800),col=c("darkblue"));
