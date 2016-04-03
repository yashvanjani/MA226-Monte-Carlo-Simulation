gammadist<-vector("numeric")
j<-0
NoOfRand<-10000
alpha<-0.4 # 0<alpha<=1
z<-0.07+(0.75*sqrt(1-alpha)) #this z is d of Kundu's paper
b<-1+(exp(-z)*alpha/z)
for(i in 1:NoOfRand)
{
	u<-runif(1)
	v<-runif(1)
	p<-b*u
	if(p>1) 
	{
		x<-(-1)*log(z*(b-p)/alpha)
		y<-x/z
		if((v*(alpha+y-(alpha*y)))<=1) # approx. to increase speed of algo, if inequlity is not satisfied then anyways else condition is checked which contains actual inequlity. this approximation is given in Second modification of Algorithm GS in Best's paper
		{
			j<-j+1
			gammadist[j]=x
		}
		else if(v<=y^(alpha-1)) # actually inequality has to be checked at this step for acceptance
		{
			j<-j+1
			gammadist[j]=x
		}
	}
	else 
	{
		x<-z*p^(1/alpha)
		if(v<=(2-x)/(2+x)) # approx. to increase speed of algo, if inequlity is not satisfied then anyways else condition is checked which contains actual inequlity. this approximation is given in Second modification of Algorithm GS in Best's paper
		{
			j<-j+1
			gammadist[j]=x
		}
		else if(v<=exp(-x)) # actually inequality has to be checked at this step for acceptance
		{
			j<-j+1
			gammadist[j]=x
		}
	}
}

acceptance_prob<-(j/NoOfRand)
cat("Acceptance probability =",acceptance_prob,"\n")

png(file="gammaBest_paper.png")
hist(gammadist, xlab="Range of random number", col="red", border="black", breaks=50)
dev.off()