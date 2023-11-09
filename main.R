# libraries
library(MASS)
source("deltaR2.R")

# Create data
set.seed(121)
n = 100 # number of data points
mu = 0
sigma <- 1
rho <- runif(1, min=0.1, max=0.9) # random sample of rho
corMat <- rbind(c(sigma,   rho), # correlation matrix
                c(rho, sigma))
d <- MASS::mvrnorm( # creates data
  n = n,
  mu = c(mu,mu),
  Sigma = corMat
)

# Create dependent variable
B <- c(0, 1, 1)
y <- B[1] + B[2]*d[, 1] + B[3]*d[, 2] + rnorm(100, sd=2)

# Combine
df <- as.data.frame(cbind(y, d))
colnames(df) <- c("y", "x1", "x2")

# Standardize data
df <- as.data.frame(scale(df, center=TRUE))

# Evaluate delta R2 between full model and restricted model
full <- y ~ x1 + x2
restrict <- y ~ x1
deltaR2(fullm = full, restrim = restrict, data = df)

