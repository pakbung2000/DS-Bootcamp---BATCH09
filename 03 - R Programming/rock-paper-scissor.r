
game <- function(){

  flush.console()
  cat("It's a Rock-Paper-Scissor Game ✂️", "\nWIN +2\nTIED +1\nLOSE 0\n")

  flush.console()
  con <- readline("Do you want to continue or stop?: ")

  hand_to_num <- function(hand){
      if(hand=="rock"){
        return(1)
      }else if (hand=="paper"){
        return(2)
      }else{
        return(3)
      }
  }

  score_matrix <- matrix(c(1,2,0,0,1,2,2,0,1), nrow = 3, ncol = 3)

  all_user_score <<- 0
  all_com_score <<- 0
  i <- 1

  while (con != "stop"){

  # USER PART
  flush.console()
  cat("\nRound ", i, "\n")
  flush.console()
  user_text <- tolower(as.character(readline("Your hand?: ")))
  user_hand <- hand_to_num(user_text)

  flush.console()
  #COM PART
  all_hands <- c("rock", "paper", "scissor")
  com_text <- sample(all_hands, 1)
  cat("Computer's hand: ", com_text, "\n")
  com_hand <- hand_to_num(com_text)

  flush.console()
  #SCORE
  user_score <- score_matrix[user_hand, com_hand]
  cat("You got ", user_score, "\n")
  all_user_score <<- user_score + all_user_score
  com_score <- score_matrix[com_hand, user_hand]
  all_com_score <<- com_score + all_com_score

  flush.console()
  # PLAY AGAIN OR NOT
  con <- readline("Do you want to continue or stop?: ")
  i <- i+1
  }

  flush.console()
  cat("\nYour total score: " , all_user_score, "\nComputer's total score: ", all_com_score)
  if (all_user_score > all_com_score){
    cat("\nYou win! Congratulation ✨")
  }else if (all_user_score < all_com_score){
    cat("\nYou lost. Wanna give another try? 🔥")
  }else{
    cat("\nIt's a tied match 🥊")
  }

}


# CALL FUNCTION
game()
