#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;
int main()
{
	ofstream myfile;
	myfile.open("output.txt");
	long long int x[3][100000];//for storing x[i]
	float u[1000];//for storing u[i]
	int f[200];
	int temp;
	long long int mean[3][100000];
	long long int var[3][100000];
	int l[6]={0,1,2,3,4,5};//amt of lag
	float autocorelation[6];

	long long int a,m;//for computing first 17 values of x[i], data taken from question 1
	int i,j;
	long long int q,r,k,b;
	x[0][0]=12345;
	x[1][0]=12345;
	x[2][0]=12345;
	
	a=16807;
	m=2147483399;
	b=pow(2,31);
	long long int n[3]={1000,10000,100000};

	//computation part

	for(i=0;i<3;i++) //loop for n[i]
	{
		for(j=0;j<16;j++) //for computing x[i][1] to x[i][16]
		{
			q=m/a;
			r=m%a;
			k=x[i][j]/q;
			x[i][j+1]=(a*(x[i][j]-(k*q)))-(k*r);
			if (x[i][j+1]<0)
				x[i][j+1]=x[i][j+1]+m;
		}
		for (j=16;j<n[i]-1;j++)
		{
			x[i][j+1]=((x[i][j-16])+(x[i][j-4]))% b;
		}

		
		//computing mean
		mean[i][0]=x[i][0];
		for(j=1;j<n[i];j++) 
		{
			mean[i][j]=((mean[i][j-1]*j)+x[i][j])/(j+1);
		}
		//computing variance
		var[i][0]=0;
		for(j=0;j<n[i]-1;j++)
		{
			var[i][j+1]=((((j+1)*(var[i][j]+pow(mean[i][j],2)))+pow(x[i][j+1],2))/(j+2))-pow(mean[i][j+1],2);
		}

		for (j=0;j<n[i];j++)
			myfile<<i<<" "<<j<<" "<<x[i][j]<<" "<<mean[i][j]<<" "<<var[i][j]<<"\n";
	}
	myfile.close();

	//computing frequency and probability distribution

	for(j=0;j<1000;j++)
	{
		u[j] = float(x[0][j])/float(b);
		temp=u[j]/0.005;
		f[temp]++;
	}

	for (j=1;j<200;j++)
		f[j]=f[j]+f[j-1];
	myfile.open("probability.txt");
	for(j=0;j<200;j++)
		myfile<<f[j]<<"\n";
	myfile.close();

	//computing autocorelation function with lags 1,2,3,4,5 

	for(i=0;i<6;i++)
	{
		for(j=l[i];j<1000;j++)
		{
			autocorelation[i]+=((float(x[0][j])-float(mean[0][999]))*(float(x[0][j-l[i]])-float(mean[0][999])));
		}
	}
	myfile.open("autocorrelation.txt");
	for(i=1;i<6;i++)
	{
		autocorelation[i]=autocorelation[i]/autocorelation[0];
		cout<<"Autocorrelation with lag "<<i<<" for 1000 random numbers = "<<autocorelation[i]<<"\n";
		myfile<<"Autocorrelation with lag "<<i<<" for 1000 random numbers = "<<autocorelation[i]<<"\n";
	}
	myfile.close();

	//printing mean to files

	myfile.open("mean1.txt");
	for (j=0;j<1000;j++)
	{
		myfile<<mean[0][j]<<"\n";
	}
	myfile.close();

	myfile.open("mean2.txt");
	for (j=0;j<10000;j++)
	{
		myfile<<mean[1][j]<<"\n";
	}
	myfile.close();

	myfile.open("mean3.txt");
	for (j=0;j<100000;j++)
	{
		myfile<<mean[2][j]<<"\n";
	}
	myfile.close();

	//printing variance to files

	myfile.open("var1.txt");
	for (j=0;j<1000;j++)
	{
		myfile<<var[0][j]<<"\n";
	}
	myfile.close();

	myfile.open("var2.txt");
	for (j=0;j<10000;j++)
	{
		myfile<<var[1][j]<<"\n";
	}
	myfile.close();

	myfile.open("var3.txt");
	for (j=0;j<100000;j++)
	{
		myfile<<var[2][j]<<"\n";
	}
	myfile.close();


	//printing plot values to files

	myfile.open("2d_plot1.txt");
	for(i=0;i<999;i++)
	{
		myfile<<x[0][i]<<"	"<<x[0][i+1]<<"\n";
	}
	myfile.close();

	myfile.open("2d_plot2.txt");
	for(i=0;i<9999;i++)
	{
		myfile<<x[1][i]<<"	"<<x[1][i+1]<<"\n";
	}
	myfile.close();

	myfile.open("2d_plot3.txt");
	for(i=0;i<99999;i++)
	{
		myfile<<x[2][i]<<"	"<<x[2][i+1]<<"\n";
	}
	myfile.close();
}