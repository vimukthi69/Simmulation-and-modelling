# Setting up the initial value for the random walk and the number of steps
x0 = 0
T = 100

# Generate T number of IID uniform random variables for each realization
x = matrix(runif(T*5, min = -1, max = 1), ncol = 5)

# Scale the random variables to have mean 0 and standard deviation 1
x = scale(x)

# Setting up the first row of each realization to x0
x[1,] = x0

# Compute the cumulative sum of each realization to get the random walk
y = apply(x, 2, cumsum)

# Setting up the plot margin for 2 units for each side
par(mar = rep(2,4))

# Plotting the five realizations of random walks
matplot(y, type='l', lty = 1, col = 1:5, main = "Five Realizations of a Random Walk")


