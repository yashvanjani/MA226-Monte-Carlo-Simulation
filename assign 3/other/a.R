m<-2^13;
a<-113;
b<-83;
x<-4;
E<-array(1.51,5000);
freq<-array(0,30);
for(i in 1:5000)
{
	x<-(a*x+b)%%m;
	u<-as.double(x)/m;
	if(u<0.00001)
	{
		i<-i-1;
	}
	else
	{
		E[i]<- -5*log(u);
		e<-as.integer(E[i]);
		freq[e+1]<-freq[e+1]+1;
	}
}
mean=mean(E);
min<-min(E)
max<-max(E);
cat("Max is:",max,"\n")
cat("min is:",min,"\n")
cat("mean is:",mean,"\n")
barplot(freq);
