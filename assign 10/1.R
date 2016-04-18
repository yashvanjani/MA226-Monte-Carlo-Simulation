library(stats)
S<-vector("numeric")
t<-vector("numeric")
pal<- palette()
t[1]=0
sec5<-vector("numeric") #for storing BM values at 5th sec
mu<-(0.1)#mu=mean
sigma<-0.03 #sigma=standard deviation

for(i in 1:4999)
{
	t[i+1]=t[i]+0.001
}
for(i in 1:10)
{
	z<-rnorm(5000, mean=0, sd=1)
	S[1]=1
	for (j in 1:4999)
	{
		S[j+1]=S[j]*exp(((mu-(sigma*sigma/2))*(0.001))+(sigma*z[j+1]*sqrt(0.001)))
		if(j==4999)
		{
			sec5[i]=S[5000]
		}

	}
	if(i==1)
	{
		plot(t,S,type="l", col=pal[i %% 8 +1],ylim=c(0,2))
	}
	else
	{
		lines(t,S, col=pal[i %% 8 +1],ylim=c(0,2))
	}
}
cat("\nFor S(t=0) = ",S[1],", mu = ",mu,", var = ",(sigma*sigma),"\n")
cat("experemntal E[S(5)] = ",mean(sec5),"\n")
cat("experemntal Var[S(5)] = ",var(sec5),"\n")
mu_theoritical<-S[1]*exp(mu*5)
var_theoritical<-S[1]*S[1]*exp(2*mu*5)*(exp(sigma*sigma*5)-1)
cat("theoritical E[S(5)] = ",mu_theoritical,"\n")
cat("theoritical Var[S(5)] = ",var_theoritical,"\n\n")