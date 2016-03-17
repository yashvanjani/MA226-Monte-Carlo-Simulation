g<-function(x)
{
	return ((exp(-abs(x))/2))
}
f<-function(x)
{
	return((exp(-(x^2)/2))/sqrt(2*pi))
}
g_inv<-function(x)
{
	if(x<0.5)
		{return(log(2*x))}
	else
		{return(((log(2*(1-x)))*(-1)))}
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
png("plot_1_1000.png")
hist(fdist, col="black", breaks=10, xlab="Random Numbers from Normal distribution");