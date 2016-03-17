#include <iostream>

using namespace std;

int main()
{
	int i,j;
	int a,b,m;
	float x;
	float u;
	a=6;
	b=0;
	m=11;
	cout<<"For a=6, b=0, m=11:\n";
	for (i=0;i<11;i++)
	{
		cout<<"\nRandom x_i for x_0="<<i<<"\n";
		x=i;
		for(j=0;j<15;j++)
		{
			cout<<x<<" ";
			x=((a*int(x))+b)%m;
		}
	}
	for(i=0;i<11;i++)
	{
		cout<<"\n";
		cout<<"Random u_i for x_0="<<i<<"\n";
		x=i;
		u=float(x/m);
		for(j=0;j<15;j++)
		{
			cout<<u<<" ";
			x=((a*int(x))+b)%m;
			u=float(x/m);
		}
		cout<<"\n";
	}
	a=3;
	b=0;
	m=11;
	cout<<"\n\nFor a=3, b=0, m=11:\n";
	for (i=0;i<11;i++)
	{
		cout<<"\nRandom x_i for x_0="<<i<<"\n";
		x=i;
		for(j=0;j<15;j++)
		{
			cout<<x<<" ";
			x=((a*int(x))+b)%m;
		}
	}
	for(i=0;i<11;i++)
	{
		cout<<"\n";
		cout<<"Random u_i for x_0="<<i<<"\n";
		x=i;
		u=float(x/m);
		for(j=0;j<15;j++)
		{
			cout<<u<<" ";
			x=((a*int(x))+b)%m;
			u=float(x/m);
		}
		cout<<"\n";
	}



}