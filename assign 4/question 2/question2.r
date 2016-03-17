f<-function(x)
{
	return (exp(-x*x/2)*(2/pi)^(1/2));
}
g<-function(x)
{
	return (exp(-x));
}
g_inv<-function(x)
{
	return (-log(1-x))
}
c<-sqrt(2*exp(1)/pi)
u<-runif(1400)
v<-runif(1400)
count<-0
sum<-0
#print(u)
x<-array(0,1400)
for(i in 1:1400)
{
	x[i]<-g_inv(u[i])
}
#print(u)
fdist<-vector('numeric')
for (i in 1:1400)
{
	if((c*g(x[i])*v[i])<=(f(x[i])))
		{
			count<-count+1
			sum<-sum+x[i]
			fdist<-c(fdist, x[i])
		}
}

mean=as.double(sum/count)
sqsum<-0
for (i in 1:1400)
{
	if((c*g(x[i])*v[i])<=(f(x[i])))
		{
			sqsum<-sqsum+((mean-x[i])^2)
		}
}
var=as.double(sqsum/count)
cat("Mean : ",mean,"\n");
cat("Standard Deviation : ",sqrt(var),"\n");
cat("Observed Acceptance probability : ",(count/1400),"\n");
cat("Theoritical Acceptance probability : ",(1/c),"\n");
png("plot_2_1000.png")
hist(fdist, col="black", breaks=10, xlab="Random Numbers from Normal distribution");