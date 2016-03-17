u=runif(5005);
v=NULL;
gamma=NULL;
for(i in 1:5004){
v[(i%%5)+1]<-u[i];
if(i>=5){
temp=(v[1])*(v[2])*(v[3])*(v[5])*(v[4]);
gamma[i-4]=log(temp)*(-0.2);
}
}
print('Maximum:');print(max(gamma));
print('Minimum:');print(min(gamma));
print('Mean calculated:');print(mean(gamma));
hist(gamma,main="X ~ Gamma(5,5)", xlab="X",ylab="Frequency",xlim=c(0,3.5),ylim=c(0,120),breaks=200,col="blue");

