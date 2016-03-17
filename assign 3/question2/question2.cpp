#include <iostream>
#include <cmath>
#include <fstream>
#include <cstdio>


using namespace std;

int main()
{
	ofstream myfile;
	int m[5]={(int)pow(2,17),(int)pow(2,19),(int)pow(2,23),(int)pow(2,27),(int)pow(2,29)};
	int a[5]={167,93,7,123,135};
	int b[5]={371,33,294,4,357};
	int x[5]={55,29,435,99,123};
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
	myfile.open("output1.txt");
	FILE* fp=fopen("output.txt","w");
	double M=sum/5000;
	myfile<<"Mean of the distribution = "<<M<<endl;
	myfile<<"Min = "<<min<<endl<<"Max = "<<max<<endl;
	for(int i=0;i<30;i++)
		fprintf(fp,"%d\n",freq[i]);
	fclose(fp);
	myfile.close();
}
