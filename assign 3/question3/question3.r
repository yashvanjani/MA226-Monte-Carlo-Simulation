f<-function(x)
{
	return (20*x*(1-x)^3);
}
m<-2^15;
a<-167;
b<-59;
x<-23;
y<-2471;
cg<-2;
freq<-array(0,50);
for(i in 1:50000)
{
	x<-(a*x+b)%%m;
	u<-as.double(x)/m;
	y<-(a*y+b+7)%%m;
	v<-as.double(y)/m;
	if(cg*u<=f(v))
		freq[v*50+1]<-freq[v*50+1]+1;
}
barplot(freq,ylim=c(0,1200),xlab="X",ylab="Frequency",col="green");

