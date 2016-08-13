require(MASS)

# For X
mu1 <- 1
sig1 <- 2

# For Y
mu2 <- 2
sig2 <- 4

rho <- 0.05

normvar <- c(0.9597, -1.3404, 1.2238, 0.2551)

# Using Cholesky's decomposition method

noofrand <- 1000
z1 <- rnorm(noofrand, mean=0, sd=1)
z2 <- rnorm(noofrand, mean=0, sd=1)
X <- mu1 + sig1*z1
Y <- mu2 + sig2*rho*z1 + sig2*sqrt(1 - rho^2)*z2

g <- kde2d(X,Y)

png(file="contour.png")
contour(g)
dev.off()
