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
plot(seq,seq2, xlim=pk, ylim=pk);