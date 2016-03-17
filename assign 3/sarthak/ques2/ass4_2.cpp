#include <iostream>
#include <cmath>
#include <cstdlib>
#include <stdio.h>

using namespace std;

int main(){
	unsigned long int m=pow(2,31)-1;
	int a=16807,x=12131415,k,r,q;
	float u,rand,max=0,min=1234,mean=0,arr[5], temp;
	for(int i=0;i<5;i++)
		arr[i]=0.0;
	for(int i=0;i<5005;i++){
		q=floor(m/a);
		k=floor(x/q);
		r=(int)m%a;
		x=(a*(x%q)-k*r);
		if(x<0)
		{
			x+=m;
		}
		u=float(x)/m;
		arr[i%5]=u;
		if(i>=5){
			temp=(arr[0])*(arr[1])*(arr[2])*(arr[3])*(arr[4]);
			rand=-0.2*log(temp);
			if(rand>max)max=rand;
			if(rand<min)min=rand;
			mean=(mean*i+rand)/(i+1);}
	}
	cout<<"mean ="<<mean<<" "<<"maximum="<<max<<" minimum="<<min<<endl;
	return 0;
}
