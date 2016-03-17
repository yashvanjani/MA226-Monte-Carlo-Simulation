U<-runif(50)
X<-vector("numeric")
p=0.123
q=1-p
for(i in 1:50)
{
	X[i]=(floor(log(U[i])/log(q))+1)
}
print(X)
frequency<-array(0,50)
for (i in 1:50) 
{
	frequency[X[i]]=frequency[X[i]]+1
}
print(frequency)
probability<-array(0,50)
for (i in 1:50)
{
	probability[i]=frequency[i]/50
}
print(probability)
png("assign6q1.png")
hist(X,col="red",main=paste("pmf of Geometric distribution(",p,",",q,")"),xlab="X",ylab="Probability", freq=FALSE, breaks=15)