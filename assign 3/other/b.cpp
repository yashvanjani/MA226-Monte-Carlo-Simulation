#include<iostream>
#include<cmath>
#include <cstdio>
using namespace std;
int main()
{
	int m[5]={(int)pow(2,23),(int)pow(2,29),(int)pow(2,23),(int)pow(2,19),(int)pow(2,29)};
	int a[5]={113,273,89,5,173};
	int b[5]={4,33,632,114,264};
	int x[5]={4,33,632,114,264};
	double u[5];
	double E[5000][5]={log(0.5)};
	double G[5000],sum=0;
	int freq[50]={0},e;
	for(int j=0;j<5;j++)
	{
		for(int i=0;i<5000;i++)
		{
			x[j]=(x[j]*a[j]+b[j])%m[j];
			u[j]=(double)x[j]/m[j];
			if(u[j]<0.0001)
				i--;
			else
				E[i][j]=log(u[j]);
		}
	}
	double max=G[0];
	double min=G[0];
	for(int i=0;i<5000;i++)
	{
		G[i]=0;
		for(int j=0;j<5;j++)
			G[i]+=E[i][j];
		G[i]=-0.2*G[i];
		e=(int)(G[i]*10);
		sum+=G[i];
		max=(G[i]>max)?G[i]:max;
		min=(G[i]<min)?G[i]:min;
		freq[e]++;
	}
	FILE* fp=fopen("output2.txt","w");
	double M=sum/5000;
	cout<<"Mean of the distribution : "<<M<<endl;
	cout<<"Min = "<<min<<endl<<"Max : "<<max<<endl;
	for(int i=0;i<30;i++)
		fprintf(fp,"%d\n",freq[i]);
	fclose(fp);
}
