library(stats)
x<-vector("numeric")
t<-vector("numeric")
pal<- palette()
t[1]=0
sec2<-vector("numeric") #for storing BM values at 2nd sec
sec5<-vector("numeric") #for storing BM values at 5th sec
for(i in 1:4999)
{
	t[i+1]=t[i]+0.001
}

mu<-0.06
sigma<-0.3

for(i in 1:10)
{
	z<-rnorm(5000, mean=0, sd=1)
	x[1]=5
	for (j in 1:4999)
	{
		x[j+1]=x[j]+(z[j+1]*sqrt(0.001)*sigma)+(mu*0.001)
		
		if(j==2000)
		{
			sec2[i]=x[2000]
		}
		if(j==4999)
		{
			sec5[i]=x[5000]
		}

	}
	if(i==1)
	{
		plot(t,x,type="l", col=pal[i %% 8 +1],ylim=c(2,8))
	}
	else
	{
		lines(t,x, col=pal[i %% 8 +1],ylim=c(2,8))
	}
}
cat("E[W(2)] = ",mean(sec2),"\n")
cat("E[W(5)] = ",mean(sec5),"\n")
