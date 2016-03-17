#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

int main()
{
	ofstream myfile;
	myfile.open("output.txt", ios::app);
	long int x[100000];
	long int a[3];
	long int m[3];
	long int q,r,k,b;
	float u[3][3][100000];
	int f[3][3][20];
	a[0]=16807;
	a[1]=40692;
	a[2]=40014;
	m[0]=(pow(2,31)-1);
	m[1]=2147483399;
	m[2]=2147483563;
	int i,j,l;
	long int n[3]={1000,10000,100000};

	for(i=0;i<3;i++) //loop for n[i]
	{
		for(j=0;j<3;j++) //loop for a[i],m[i]
		{
			x[0]=12345;
			for(l=0;l<n[i]-1;l++) //loop for calculating x[i]
			{
				q=m[j]/a[j];
				r=m[j] % a[j];
				k=x[l]/q;
				b=x[l]-(k*q);
				x[l+1]=(a[j]*b)-(k*r);
				if (x[l+1]<0)
					x[l+1]=x[l+1]+m[j];
				u[i][j][l+1]=float(x[l+1])/float(m[j]);
			}
			u[i][j][0]=float(x[0])/float(m[j]);
			for(l=0;l<n[i];l++)
            {
                if(u[i][j][l]>=0 && u[i][j][l]<0.05)
                    f[i][j][0]++;
                if(u[i][j][l]>=0.05 && u[i][j][l]<0.10)
                    f[i][j][1]++;
                if(u[i][j][l]>=0.10 && u[i][j][l]<0.15)
                    f[i][j][2]++;
                if(u[i][j][l]>=0.15 && u[i][j][l]<0.20)
                    f[i][j][3]++;
                if(u[i][j][l]>=0.20 && u[i][j][l]<0.25)
                    f[i][j][4]++;
                if(u[i][j][l]>=0.25 && u[i][j][l]<0.30)
                    f[i][j][5]++;
                if(u[i][j][l]>=0.30 && u[i][j][l]<0.35)
                    f[i][j][6]++;
                if(u[i][j][l]>=0.35 && u[i][j][l]<0.40)
                    f[i][j][7]++;
                if(u[i][j][l]>=0.40 && u[i][j][l]<0.45)
                    f[i][j][8]++;
                if(u[i][j][l]>=0.45 && u[i][j][l]<0.50)
                    f[i][j][9]++;
                if(u[i][j][l]>=0.50 && u[i][j][l]<0.55)
                    f[i][j][10]++;
                if(u[i][j][l]>=0.55 && u[i][j][l]<0.60)
                    f[i][j][11]++;
                if(u[i][j][l]>=0.60 && u[i][j][l]<0.65)
                    f[i][j][12]++;
                if(u[i][j][l]>=0.65 && u[i][j][l]<0.70)
                    f[i][j][13]++;
                if(u[i][j][l]>=0.70 && u[i][j][l]<0.75)
                    f[i][j][14]++;
                if(u[i][j][l]>=0.75 && u[i][j][l]<0.80)
                    f[i][j][15]++;
                if(u[i][j][l]>=0.80 && u[i][j][l]<0.85)
                    f[i][j][16]++;
                if(u[i][j][l]>=0.85 && u[i][j][l]<0.90)
                    f[i][j][17]++;
                if(u[i][j][l]>=0.90 && u[i][j][l]<0.95)
                    f[i][j][18]++;
                if(u[i][j][l]>=0.95 && u[i][j][l]<=1)
                    f[i][j][19]++;
 
            }
		}

	}



	for(i=0;i<3;i++) //loop for n[i]
	{
		myfile<<"For n="<<n[i]<<"\n";
		for(j=0;j<3;j++) //loop for a[i],m[i]
		{
			myfile<<"		For a="<<a[j]<<" and m="<<m[j]<<"\n";
			for(l=0;l<20;l++) //loop for calculating x[i]
			{
				
				myfile<<f[i][j][l]<<"\n";
			}
		}
		cout<<"\n";

	}
	myfile.close();

	myfile.open("2dplot1.txt", ios::app);
	for(l=0;l<999;l++)
	{
		myfile<<u[0][0][l]<<"		"<<u[0][0][l+1]<<"\n";
	}
	myfile.close();

	myfile.open("2dplot2.txt", ios::app);
	for(l=0;l<9999;l++)
	{
		myfile<<u[1][0][l]<<"		"<<u[1][0][l+1]<<"\n";
	}
	myfile.close();

	myfile.open("2dplot3.txt", ios::app);
	for(l=0;l<99999;l++)
	{
		myfile<<u[2][0][l]<<"		"<<u[2][0][l+1]<<"\n";
	}
	myfile.close();

	myfile.open("2dplot_zoom1.txt", ios::app);
	for(l=0;l<999;l++)
	{
		if(u[0][0][l]<=0.001 )//&& u[0][0][l+1]<=0.001)
			myfile<<u[0][0][l]<<"		"<<u[0][0][l+1]<<"\n";
	}
	myfile.close();

	myfile.open("2dplot_zoom2.txt", ios::app);
	for(l=0;l<9999;l++)
	{
		if(u[1][0][l]<=0.001 )//&& u[1][0][l+1]<=0.001)
			myfile<<u[1][0][l]<<"		"<<u[1][0][l+1]<<"\n";
	}
	myfile.close();

	myfile.open("2dplot_zoom3.txt", ios::app);
	for(l=0;l<99999;l++)
	{
		if(u[2][0][l]<=0.001 )//&& u[2][0][l+1]<=0.001)
			myfile<<u[2][0][l]<<"		"<<u[2][0][l+1]<<"\n";
	}
	myfile.close();
}