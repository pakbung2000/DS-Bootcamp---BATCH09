
import random
## welcome

welcome = """
██████╗  ██████╗  ██████╗██╗  ██╗    ██████╗  █████╗ ██████╗ ███████╗██████╗     ███████╗ ██████╗██╗███████╗███████╗ ██████╗ ██████╗ ███████╗
██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝    ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗    ██╔════╝██╔════╝██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
██████╔╝██║   ██║██║     █████╔╝     ██████╔╝███████║██████╔╝█████╗  ██████╔╝    ███████╗██║     ██║███████╗███████╗██║   ██║██████╔╝███████╗
██╔══██╗██║   ██║██║     ██╔═██╗     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗    ╚════██║██║     ██║╚════██║╚════██║██║   ██║██╔══██╗╚════██║
██║  ██║╚██████╔╝╚██████╗██║  ██╗    ██║     ██║  ██║██║     ███████╗██║  ██║    ███████║╚██████╗██║███████║███████║╚██████╔╝██║  ██║███████║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
"""

## rock
rock_pic = """
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
"""

## paper
paper_pic = """
     _______
---'    ____)____
           ______)
          _______)
         _______)
---.__________)
"""

## scissors
scissor_pic = """
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
"""

pic = [rock_pic, paper_pic, scissor_pic]
print(welcome, "\nIt's a rock-paper-scissor game!\nWIN +2\nTIED +1\nLOSE 0")

hand = ["rock", "paper", "scissor"]
i = 0
user_total = 0
com_total = 0
score = [[1, 0, 2], [2, 1, 0], [0, 2, 1]]

con_stop = input("Do you want to continue or stop? ")
# loop
while con_stop != "stop":
  print(f"\nRound {i+1}")
  # user hand
  user_input = str(input("What do you choose? "))
  user_index = hand.index(user_input)
  user_hand = hand[user_index]

  # computer hand
  com_index = random.randint(0, 2)
  com_hand = hand[com_index]

  print(f"Your hand: {pic[user_index]}")
  print(f"Computer'hand: {pic[com_index]}")

  user_score = score[user_index][com_index]
  print(f"You got + {user_score}")
  user_total += user_score
  
  com_score = score[com_index][user_index]
  com_total += com_score

  con_stop = input("Do you want to continue or stop? ")
  i += 1

print(f"\nYour total score: {user_total}")
print(f"Computer's total score: {com_total}")
if user_total > com_total:
  print("You win! Congratulation ✨")
elif user_total == com_total:
  print("It's a tied match 🥊")
else:
  print("You lost. Wanna give another try? 🔥")






