u<-runif(10)
p<-c(0.05,0.25,0.45,0.15,0.10)
c<-cumsum(p)
sum<-0
sqsum<-0
freq<-array(0,5)

for(i in 1:10)
{
	for(j in 1:5)
	{
		if(u[i]<c[j])
		{
			freq[j]=freq[j]+1
			sum=sum+j
			break;
		}
	}
}
mean<-as.double(sum)/10
for(i in 1:5)
	sqsum=sqsum+freq[i]*(mean-i)^2
var=as.double(sqsum)/10
cat("Mean : ",mean,"\n")
cat("Variance : ",var,"\n")
png("plot3a.png")
barplot(freq, col="darkblue")
dev.off()