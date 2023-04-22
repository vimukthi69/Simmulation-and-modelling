#part a
# Defining the transition matrix
Matrx <- matrix(c(0.1, 0.2, 0.7, 
               0.2, 0.4, 0.4,
               0.1, 0.3, 0.6), nrow = 3, byrow = TRUE)
 
 
#Generating 5 possible purchases according to the given scenario
number_Of_simulations <- 5
states <- matrix("A", number_Of_simulations, 10) #matrix to store states
for (i in 1: number_Of_simulations) {
    for (j in 2:10) {
        previous_state <- match(states[i, j-1], c("A", "B", "C")) #previous stateset to index
        current_state <- sample(c("A", "B", "C"), size = 1, prob = Matrx[previous_state,])
        states[i, j] <- current_state #updating current state
    }
}
 
cat("5 Possible beer purchase for 10 weeks are sequences:\n")

for (k in 1:5){
      cat(states[k,],"\n")
}


#part b

initial_state <- c(1, 0, 0)
M_4 <- Matrx %*% Matrx %*% Matrx %*% Matrx 
new_trans_matrx <- initial_state %*% M_4
probability <- new_trans_matrx[1,1]
cat("The probability of purcahsing Brand A beer in first week and again in the fifth week :\n", probability)
 