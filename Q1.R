# part a
# Generating 10000 weights and heights from using normal distribution
Weight <- rnorm(10000, 60, sqrt(3*3))
Height <- rnorm(10000, 1.6, sqrt(0.1*0.1))

# Calculate BMI for each weight and height pairs 
BMI <- Weight / Height^2
# printing generated BMI values
head(BMI)

# part b
hist(BMI, breaks = 30, col = "lightblue", main = "Empirical Distribution of BMI")

# part c
# calculating approximate mean
approximate_mean_of_BMI <- mean(BMI)
# calculating approximate variance 
approximate_variance_of_BMI <- var(BMI)
print(paste0("Approximate mean of BMI is ", approximate_mean_of_BMI))
print(paste0("Approximate variance of BMI is ", approximate_variance_of_BMI))

# part d
bmi_grtOrequal_25 <- sum(BMI >= 25) / length(BMI)
print(paste0("BMI values greater than or equal to 25: ", round(bmi_grtOrequal_25, 3)))

