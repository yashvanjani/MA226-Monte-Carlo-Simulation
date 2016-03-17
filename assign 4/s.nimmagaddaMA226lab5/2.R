f<-function(x)
{
	return (exp(-x*x/2)*(2/pi)^(1/2));
}
g<-function(x)
{
	return (exp(-x));
}
h<-function(x)
{
	return (-log(1-x))
}
c<-1.4;
m<-2^13;
a<-113;
b<-83;
x<-4;
y<-91;
freq<-array(0,50);
for(i in 1:10000)
{
	x<-(a*x+b)%%m;
	u<-as.double(x)/m;
	y<-(a*y+b+80)%%m;
	v<-as.double(y)/m;
	Y<-h(v);
	if(c*g(Y)*u<=f(Y))
		freq[Y*15+1]<-freq[Y*15+1]+1;
}
png("plot2.png")
barplot(freq);
dev.off()
