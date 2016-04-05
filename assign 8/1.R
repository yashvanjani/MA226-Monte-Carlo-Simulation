m<-vector("numeric")
m[1]=10^2
m[2]=10^3
m[3]=10^4
m[4]=10^5
for(i in 1:4)
{
	u<-runif(m[i])
	Y<-vector("numeric")
	for(j in 1:m[i])
	{
		Y[j]=exp(sqrt(u[j]))
	}
	I=sum(Y)/m[i]
	var=var(Y)
	min=I-(1.95*sqrt(var)/sqrt(m[i]))
	max=I+(1.95*sqrt(var)/sqrt(m[i]))
	cat("\nI_",m[i]," = ",I,"\n")
	cat("var_",m[i]," = ",var,"\n")
	cat("min_",m[i]," = ",min,"\n")
	cat("max_",m[i]," = ",max,"\n")
}