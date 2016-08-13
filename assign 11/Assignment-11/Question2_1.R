seq=NULL;
for(i in 1:100){
	p=NULL;
	res <- 0;
	num=i;
	for(j in 1:8){
		p[j]=num%%2;
		num=num%/%2;
	}
	for(k in 1:8){
		res=res+p[k]*2^(-k);
	}
	seq[i]=res;
}
seq2=NULL;
for(i in 1:100){
	p=NULL;
	res <- 0;
	num=i;
	for(j in 1:5){
		p[j]=num%%3;
		num=num%/%3;
	}
	for(k in 1:5){
		res=res+p[k]*3^(-k);
	}
	seq2[i]=res;
}
plot(seq,seq2);