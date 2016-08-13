a <- 1229;
b <- 1;
m <- 2048;
x <- 0;
x <- (a*x+b)%%m;
u <- x/m;
Cor1=NULL;
Cor2=NULL;

for(i in 1:100000)
{
	x <- (a*x+b)%%m;
	Cor1[i]=u;
	u <- x/m;
	Cor2[i] <- u;
}


seq=NULL;
for(i in 1:100001){
	p=NULL;
	res <- 0;
	num=i;
	for(j in 1:18){
		p[j]=num%%2;
		num=num%/%2;
	}
	for(k in 1:18){
		res=res+p[k]*2^(-k);
	}
	seq[i]=res;
}
#Making 2-D pairs.
seq2=NULL;
for(s in 1:100000){
	seq2[s]=seq[s+1];
}
length(seq) <- 100000;

pk=c(0,1);

old.par <- par(mfrow=c(1, 2));
plot(Cor1, Cor2, main="LCG:a=1229,b=1,m=2048");
plot(seq, seq2,  main="Van der Corput");
par(old.par);