seq=NULL;
for(i in 1:1000){
	p=NULL;
	res <- 0;
	num=i;
	for(j in 1:11){
		p[j]=num%%2;
		num=num%/%2;
	}
	for(k in 1:11){
		res=res+p[k]*2^(-k);
	}
	seq[i]=res;
}
#Making 2-D pairs.
seq2=NULL;
for(s in 1:999){
	seq2[s]=seq[s+1];
}
#Finding the overlapping values and plotting.

overl1=NULL;
overl2=NULL;
m <- 0;
for(q in 2:999){
	cor1 <- seq[q];
	cor2 <- seq2[q];
	for(r in 2:q-1){
		n1=seq[r];
		n2=seq2[r];
		if((cor1==n1) & (cor2==n2)){
			m=m+1;
			overl1[m]=cor1;
			overl2[m]=cor2;
			break;
		}
	}
}
pk=c(0,1);
plot(overl1,overl2, xlim=pk, ylim=pk);