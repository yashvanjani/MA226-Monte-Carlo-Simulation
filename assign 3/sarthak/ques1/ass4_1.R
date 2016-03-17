x=runif(5000); 
x<-log(1-x)*(-5);
print('Maximum:');
print(max(x));
print('Minimum:');
print(min(x));
print('Mean calculated:');
print(mean(x));
hist(x,main="X ~ Exp(1/5)", xlab="X",ylab="Frequency",xlim=c(0,45),ylim=c(0,900),breaks=50,col="red");
