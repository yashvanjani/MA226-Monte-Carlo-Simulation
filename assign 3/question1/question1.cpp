#include <iostream>
#include <cmath>
#include <fstream>

using namespace std;

int main()
{
	ofstream myfile;
	myfile.open("output.txt");
	int a=167, b= 59, x=23, e;
	int m=pow(2,15);
	double E[5000]={0};
	double u, sum=0;
	int freq[35]={0};
	int i;
	for(i=0;i<5000;i++)
	{
		x=(a*x+b)%m;
		u=double(x)/double(m);

		if(u<0.0001)
		{
			i--;
		}
		else
		{
			E[i]=-5*log(u);
			e=int(E[i]);
			freq[e]++;
		}
	}
	for(i=0;i<35;i++)
		myfile<<"freq["<<i<<"]="<<freq[i]<<"\n";

	double max=E[0], min=E[0];
	for(i=0;i<5000;i++)
	{
		if(E[i]>max)
			max=E[i];
		if(E[i]<min)
			min=E[i];
		sum=sum+E[i];
	}
	double mean=double(sum)/5000;
	myfile<<"\nmean = "<<mean<<"\n";
	myfile<<"max = "<<max<<"\n";
	myfile<<"min = "<<min<<"\n";

	myfile.close();
}