#include <iostream>
#include <fstream>

using namespace std;

int main()
{
	//ofstream myfile;
	//myfile.open("output.txt", ios::app);

	int i,j;
	int a,b,m;
	float x[1000];
	float u[1000];
	a=1229;
	b=1;
	m=2048;
	x[0]=157;
	for(i=0;i<1000;i++)
	{
		x[i+1]=(int((a*x[i])+b))%m;
		u[i+1]=x[i+1]/m;
	}
	u[0]=x[0]/m;
	for(i=0;i<1000;++i)
		cout<<u[i]<<"		"<<u[i+1]<<"\n";
	//myfile.close();
}