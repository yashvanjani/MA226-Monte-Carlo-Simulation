#include <iostream>
#include <fstream>

using namespace std;

int main()
{
	ofstream myfile;
	myfile.open("output.txt", ios::app);
	
	int i,j,k,l;
	int a[2],b,m;
	float x[500000];
	int n[5];
	char filename[6];
	n[0]=1000;
	n[1]=500;
	n[2]=5000;
	n[3]=50000;
	n[4]=500000;
	float u[250000];
	int f[20];
	a[0]=1597;
	a[1]=51749;
	b=0;
	m=244944;
	char freq[20][100]={"0.00-0.05","0.05-0.10","0.10-0.15","0.15-0.20","0.20-0.25","0.25-0.30","0.30-0.35","0.35-0.40","0.40-0.45","0.45-0.50","0.50-0.55","0.55-0.60","0.60-0.65","0.65-0.70","0.70-0.75","0.75-0.80","0.80-0.85","0.85-0.90","0.90-0.95","0.95-1.00"};
	{
		myfile<<"For a="<<a[0]<<", b="<<b<<", m="<<m<<":\n";
		for (k=0;k<5;k++)
		{
			
			
			x[0]=12345;
			myfile<<"\nFor n="<<n[k];			
			u[0]=float(x[0]/m);
			for(j=0;j<n[k]-1;j++)
			{
				x[j+1]=((a[0]*int(x[j]))+b)%m;
				u[j+1]=float(x[j+1]/m);
			}
			myfile<<"\n";

			for(i=0;i<20;i++)
			{
				f[i]=0;
			}

			for(i=0;i<n[k];i++)
			{
				if(u[i]>=0 && u[i]<0.05)
					f[0]++;
				if(u[i]>=0.05 && u[i]<0.10)
					f[1]++;
				if(u[i]>=0.10 && u[i]<0.15)
					f[2]++;
				if(u[i]>=0.15 && u[i]<0.20)
					f[3]++;
				if(u[i]>=0.20 && u[i]<0.25)
					f[4]++;
				if(u[i]>=0.25 && u[i]<0.30)
					f[5]++;
				if(u[i]>=0.30 && u[i]<0.35)
					f[6]++;
				if(u[i]>=0.35 && u[i]<0.40)
					f[7]++;
				if(u[i]>=0.40 && u[i]<0.45)
					f[8]++;
				if(u[i]>=0.45 && u[i]<0.50)
					f[9]++;
				if(u[i]>=0.50 && u[i]<0.55)
					f[10]++;
				if(u[i]>=0.55 && u[i]<0.60)
					f[11]++;
				if(u[i]>=0.60 && u[i]<0.65)
					f[12]++;
				if(u[i]>=0.65 && u[i]<0.70)
					f[13]++;
				if(u[i]>=0.70 && u[i]<0.75)
					f[14]++;
				if(u[i]>=0.75 && u[i]<0.80)
					f[15]++;
				if(u[i]>=0.80 && u[i]<0.85)
					f[16]++;
				if(u[i]>=0.85 && u[i]<0.90)
					f[17]++;
				if(u[i]>=0.90 && u[i]<0.95)
					f[18]++;
				if(u[i]>=0.95 && u[i]<=1)
					f[19]++;
			}

			for(i=0;i<20;i++)
			{
				myfile <<i<<"	"<<freq[i]<<"	"<<f[i]<<"\n";
			}
			myfile<<"\n";
		}
	}
	myfile.close();		
}