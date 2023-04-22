# Given probabilities of winning a point when serving
p1_serve_p1_win <- 0.55  # player 1
p2_serve_p1_win <- 0.4   # player 2

# Simulating 1000 games
number_of_games <- 1000

# variables which stores number of wins per each rule
rule_A <- 0
rule_B <- 0

rule_A_lengths <- c()
rule_B_lengths <- c()

for (i in 1:number_of_games) {
  # Service rule A of the game
  k <- 1
  p1_score <- 0
  p2_score <- 0
  for (j in 1:3) {
    if (k %% 2 != 0) {  # player 1 serves
      if (runif(1) <= p1_serve_p1_win) {  # player 1 wins the point and serves again
        p1_score <- p1_score + 1
        k <- 1
      } else {  # player 2 wins the point and serves next
        p2_score <- p2_score + 1
        k <- 2
      }
    } else {  # player 2 serves
      if (runif(1) <= p2_serve_p1_win) {  # player 2 wins the point and serves again
        p2_score <- p2_score + 1
        k <- 2
      } else {  # player 1 wins the point and serves next
        p1_score <- p1_score + 1
        k <- 1
      }
    }
    # Checking whether a player has won the game
    if (p1_score == 2) {
      rule_A <- rule_A + 1
      rule_A_lengths <- c(rule_A_lengths, j)
      break
    } else if (p2_score == 2) {
      rule_A_lengths <- c(rule_A_lengths, j)
      break
    }
  }
  
  # Service rule B of the game
  k <- 1
  p1_score <- 0
  p2_score <- 0
  for (j in 1:3) {
    if (k %% 2 != 0) {  # player 1 serves
      if (runif(1) <= p1_serve_p1_win) {  # player 1 wins the point and serves again
        p1_score <- p1_score + 1
        k <- 2
      } else {  # player 2 wins the point and serves next
        p2_score <- p2_score + 1
        k <- 1
      }
    } else {  # player 2 serves
      if (runif(1) <= p2_serve_p1_win) {  # player 2 wins the point and serves again
        p2_score <- p2_score + 1
        k <- 1
      } else {  # player 1 wins the point and serves next
        p1_score <- p1_score + 1
        k <- 2
      }
    }
    # Checking whether a player has won the game 
    if (p1_score == 2) {
      rule_B <- rule_B + 1
      rule_B_lengths <- c(rule_B_lengths, j)
      break
    } else if (p2_score == 2) {
      rule_B_lengths <- c(rule_B_lengths, j)
      break
    }
  }
}

# Part a
prob_rule_a <- rule_A / number_of_games
prob_rule_b <- rule_B / number_of_games



# Printing probabilities of player 1 winning a game under each rule
cat("Winning probability of Player 1 under service rule A:", round(prob_rule_a, 3), "\n")
cat("Winning probability of Player 1 under service rule B:", round(prob_rule_b, 3))

# Part b

# Estimating expected game lengths under each rule
expected_rule_a <- mean(rule_A_lengths)
expected_rule_b <- mean(rule_B_lengths)

# Printing estimates
cat("Expected length of a game under service rule A:", round(expected_rule_a, 2), "\n")
cat("Expected length of a game under service rule B:", round(expected_rule_b, 2))

