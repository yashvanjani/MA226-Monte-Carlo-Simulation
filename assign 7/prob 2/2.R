library(MASS)
a<-vector("numeric")
a[1]=-0.25
a[2]=0
a[3]=0.25
u<-vector("numeric")
u[1]=5
u[2]=8
E11=1
E12=2*a
E21=2*a
E22=4
Z1<-rnorm(1000)
Z2<-rnorm(1000)
X1<-vector("numeric")
X2<-vector("numeric")

for (i in 1:1000)
{
	X1[i]=u[1]+Z1[i]
	X2[i]=u[2]+(2*a[1]*Z1[i])+(4*Z2[i])
}

png("X1_a=-0.25.png")
plot(ecdf(X1))
d1<-seq(0,10,length=1000)
hx<-pnorm(d1, mean=5, sd=1)
lines(d1,hx,col="red")
dev.off()

png("X2._a=-0.25png")
plot(ecdf(X2))
d2<-seq(-5,21,length=1000)
hx<-pnorm(d2, mean=8, sd=4)
lines(d2,hx,col="red")
dev.off()

for (i in 1:1000)
{
	X1[i]=u[1]+Z1[i]
	X2[i]=u[2]+(2*a[2]*Z1[i])+(4*Z2[i])
}

png("X1_a=0.png")
plot(ecdf(X1))
d1<-seq(0,10,length=1000)
hx<-pnorm(d1, mean=5, sd=1)
lines(d1,hx,col="red")
dev.off()

png("X2_a=0.png")
plot(ecdf(X2))
d2<-seq(-5,21,length=1000)
hx<-pnorm(d2, mean=8, sd=4)
lines(d2,hx,col="red")
dev.off()

for (i in 1:1000)
{
	X1[i]=u[1]+Z1[i]
	X2[i]=u[2]+(2*a[3]*Z1[i])+(4*Z2[i])
}

png("X1_a=0.25.png")
plot(ecdf(X1))
d1<-seq(0,10,length=1000)
hx<-pnorm(d1, mean=5, sd=1)
lines(d1,hx,col="red")
dev.off()

png("X2_a=0.25.png")
plot(ecdf(X2))
d2<-seq(-5,21,length=1000)
hx<-pnorm(d2, mean=8, sd=4)
lines(d2,hx,col="red")
dev.off()