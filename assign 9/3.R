library(stats)
Y<-vector("numeric")
t<-vector("numeric")
pal<- palette()
t[1]=0
sec2<-vector("numeric") #for storing BM values at 2nd sec
sec5<-vector("numeric") #for storing BM values at 5th sec
mu<-vector("numeric")
sigma<-vector("numeric")
for(i in 1:4999)
{
	t[i+1]=t[i]+0.001
}
for(i in 1:5000)
{
	mu[i]=0.0325-(0.05*(t[i]))
	sigma[i]=0.012+(0.0138*t[i])+(0.00125*t[i]*t[i])
}

for(i in 1:10)
{
	z<-rnorm(5000, mean=0, sd=1)
	Y[1]=5
	for (j in 1:4999)
	{
		Y[j+1]=Y[j]+(z[j+1]*sqrt(0.001)*sigma[j])+(mu[j]*0.001)
		
		if(j==2000)
		{
			sec2[i]=Y[2000]
		}
		if(j==4999)
		{
			sec5[i]=Y[5000]
		}

	}
	if(i==1)
	{
		plot(t,Y,type="l", col=pal[i %% 8 +1],ylim=c(4,6))
	}
	else
	{
		lines(t,Y, col=pal[i %% 8 +1],ylim=c(4,6))
	}
}
cat("E[W(2)] = ",mean(sec2),"\n")
cat("E[W(5)] = ",mean(sec5),"\n")

