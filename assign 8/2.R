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
	I_y=sum(Y)/m[i]
	var_y=var(Y)
	Z<-vector("numeric")
	for(j in 1:m[i])
	{
		Z[j]=(exp(sqrt(u[j]))+exp(sqrt(1-u[j])))/2
	}
	I_z=sum(Z)/m[i]
	var_z=var(Z)
	min=I_z-(1.95*sqrt(var_z)/sqrt(m[i]))
	max=I_z+(1.95*sqrt(var_z)/sqrt(m[i]))
	cat("\nI_",m[i]," = ",I_z,"\n")
	cat("var_",m[i]," = ",var_z,"\n")
	cat("min_",m[i]," = ",min,"\n")
	cat("max_",m[i]," = ",max,"\n")
	delta=(var_y-var_z)/var_y*100
	cat("Percentage of variance reduction for ",m[i]," random numbers = ",delta,"\n")
}