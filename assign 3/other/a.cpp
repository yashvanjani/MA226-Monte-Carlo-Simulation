#include<iostream>
#include<cmath>
#include<cstdio>
using namespace std;
int main()
{
	int m=pow(2,13);
	int a=113,b=83,x=4,e;
	double u,sum=0;
	double E[5000]={1.51};
	int freq[30]={0};
	for(int i=0;i<5000;i++)
	{
		x=(a*x+b)%m;
		u=(double)x/m;
		if(u<0.0001)
			i--;
		else
		{
			E[i]= -5*log(u);
			e=(int)E[i];
			freq[e]++;
		}
	}
	double max=E[0];
	double min=E[0];
	for(int i=0;i<5000;i++)
	{	
		max=(E[i]>max)?E[i]:max;
		min=(E[i]<min)?E[i]:min;
		sum=sum+E[i];
	}
	double M=sum/5000;
	cout<<"Mean of the distribution is : "<<M<<endl;
	cout<<"Maximum of the distribution is : "<<max<<endl;
	cout<<"Minimum of the distribution is : "<<min<<endl;
	FILE* fp;
	fp=fopen("output1.txt","w");
	for(int i=0;i<30;i++)
		fprintf(fp,"%d\n",freq[i]);
	fclose(fp);
}
