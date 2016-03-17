#include <iostream>
#include <cmath>
#include <cstdlib>
#include <stdio.h>

using namespace std;

int main(){
	unsigned long int m=pow(2,31)-1;
	int a=16807,x=12131415,k,r,q;
	float u,num,max=0,min=1234,mean=0	;
	for(int i=0;i<5000;i++){
		q=floor(m/a);
		k=floor(x/q);
		r=(int)m%a;
		x=(a*(x%q)-k*r);
		if(x<0)
			x+=m;
		u=(float)x/m;
		num=-5*log(1-u);
		if(num>max)
			max=num;
		if(num<min)
			min=num;
		mean=(mean*i+num)/(i+1);
	}
	cout<<"mean ="<<mean<<" "<<"maximum="<<max<<" minimum="<<min<<endl;
	return 0;
}
