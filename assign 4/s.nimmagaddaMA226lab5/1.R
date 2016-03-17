f<-function(x)
{
	return (exp(-x*x/2)*(1/(2*pi))^(1/2));
}
g<-function(x)
{
	return (exp(-abs(x))/2);
}
h<-function(x)
{
	if(x>=0.5)
		return (-log(2*(1-x)))
	else
		return (log(2*x))
}
c<-sqrt(2*exp(1)/pi);
m<-2^13;
a<-113;
b<-83;
x<-4;
y<-91;
count<-0.0;
sum<-0.0;
sqsum<-0.0;
freq<-array(0,100);
for(i in 1:10000)
{
	x<-(a*x+b)%%m;
	u<-as.double(x)/m;
	y<-(a*y+b+80)%%m;
	v<-as.double(y)/m;
	Y<-h(v);
	if(c*g(Y)*u<=f(Y))
	{
		if(v>=0.00001)
		{
			count<-count+1;
			sum<-sum+Y;
			freq[Y*15+51]<-freq[Y*15+51]+1;
		}
	}
}
mean<-sum/10000;
for(i in 1:100)
	sqsum<-sqsum+freq[i]*(mean-(as.double(i-51)/15))^2;
var<-sqsum/10000;
cat("Mean : ",mean,"\n");
cat("Standard Deviation : ",sqrt(var),"\n");
cat("Observed Acceptance probability : ",(count/10000),"\n");
cat("Theoritical Acceptance probability : ",(1/c),"\n");
png("plot1.png")
barplot(freq);
dev.off()