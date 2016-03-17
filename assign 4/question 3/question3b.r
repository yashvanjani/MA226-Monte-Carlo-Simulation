f<-function(x)
{
	p<-c(0.05,0.25,0.45,0.15,0.10)
	return (p[x])
}
c<-0.45
sum<-0
sqsum<-0
count<-0
freq<-array(0,5)
while(count<=10)
{
	u<-runif(1)
	v<-runif(1)
	y<-as.integer((v*5)+1)
	if(c*u<f(y))
	{
		freq[y]=freq[y]+1
		sum=sum+y
		count=count+1
	}
}
mean<-as.double(sum)/10
for(i in 1:5)
{
	sqsum=sqsum+freq[i]*(mean-i)^2
}
var<-as.double(sqsum)/10
cat("Mean : ",mean,"\n")
cat("Variance : ",var,"\n")
png("plot3b.png")
barplot(freq, col="darkblue")
dev.off()