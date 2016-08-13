for(i in 1:25){
	p=NULL;
	res <- 0;
	num=i;
	for(j in 1:5){
		p[j]=num%%2;
		num=num%/%2;
	}
	for(k in 1:5){
		res=res+p[k]*2^(-k);
	}
		cat(res, " , ");
}