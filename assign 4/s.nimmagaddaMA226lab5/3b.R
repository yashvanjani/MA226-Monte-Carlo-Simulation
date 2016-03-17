f<-function(x)
{
	p<-c(0.05,0.25,0.45,0.15,0.10)
	return (p[x])
}
m<-2^13
a<-113
b<-83
x<-50
y<-60
cg<-0.5
sum<-0
sqsum<-0
count<-0
freq<-array(0,5)
while(count!=10)
{
	x<-(a*x+b)%%m
	u<-as.double(x)/m
	y<-(a*y+b+80)%%m
	v<-as.double(y)/m
	Y<-as.integer(v*5)+1
	if(cg*u<f(Y))
	{
		freq[Y]<-freq[Y]+1
		sum<-sum+Y
		count<-count+1
	}
}
mean<-as.double(sum)/10
for(i in 1:5)
	sqsum<-sqsum+freq[i]*(mean-i)^2;
var<-as.double(sqsum)/10
cat("Mean : ",mean,"\n")
cat("Variance : ",var,"\n")
png("plot3b.png")
barplot(freq)
dev.off()