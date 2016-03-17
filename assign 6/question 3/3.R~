u<-runif(50)
f<-array(0,50)
x1<-array(0,50)
x2<-array(0,50)
for(i in 1:50)
{
	x1[i]=rweibull(1,2,1)
	x2[i]=rweibull(1,1.5,1)
	if(u[i]<=0.4)
		f[i]=x1[i]
	if(u[i]>0.4)
		f[i]=x2[i]
}
print(f)
png("assign6q3.png")
hist(f,col="red")
