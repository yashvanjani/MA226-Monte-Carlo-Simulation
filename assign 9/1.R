library(stats)
w<-vector("numeric")
t<-vector("numeric")
pal<- palette()
t[1]=0
sec2<-vector("numeric") #for storing BM values at 2nd sec
sec5<-vector("numeric") #for storing BM values at 5th sec
for(i in 1:4999)
{
	t[i+1]=t[i]+0.001
}
for(i in 1:10)
{
	z<-rnorm(5000, mean=0, sd=1)
	w[1]=0
	for (j in 1:4999)
	{
		w[j+1]=w[j]+z[j+1]*sqrt(0.001)
		if(j==2000)
		{
			sec2[i]=w[2000]
		}
		if(j==4999)
		{
			sec5[i]=w[5000]
		}

	}
	if(i==1)
	{
		plot(t,w,type="l", col=pal[i %% 8 +1],ylim=c(-5,5))
	}
	else
	{
		lines(t,w, col=pal[i %% 8 +1],ylim=c(-5,5))
	}
}
cat("E[W(2)] = ",mean(sec2),"\n")
cat("E[W(5)] = ",mean(sec5),"\n")
