

## welcome

welcome = """
.-.-.-..---..-.   .---..----..-.-.-..---.
| | | || |- | |__ | |  | || || | | || |- 
`-----'`---'`----'`---'`----'`-'-'-'`---'
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

print(welcome, "\nIt's a rock-paper-scissor game!", "\nWe will play 5 rounds, then count scores")
print("WIN +2\nTIED +1\nLOSE 0\n")

## hand
hand = ["rock", "paper", "scissor"]

## calculating fuction
i = 0
user_score = []
com_score = []

score = [[1, 0, 2], [2, 1, 0], [0, 2, 1]]

def calscore(user_index, com_index):
  user_score.append(score[user_index][com_index])
  com_score.append(2-user_score[i])

  if user_score[i] > com_score[i]:
    print("You got +2\n")
  elif user_score[i] == com_score[i]:
    print("You got +1\n")
  else:
    print("You got 0, try again!\n")


## loop of game
while True:
  print(f"ROUND{i+1}")
  print("Enter rock, paper or scissor")
  user_input = str(input("What do you choose? "))
  user_index = hand.index(user_input)
  user_hand = hand[user_index]

  ## computer hand
  com_index = random.randint(0, 2)
  com_hand = hand[com_index]

  print(f"Your hand: {pic[user_index]}")
  print(f"Computer'hand: {pic[com_index]}")

  calscore(user_index, com_index)

  con_stop = input("Do you want to continue or stop? ")

## calculate total score
  if con_stop == "stop":
    sum_com = sum(com_score)
    sum_user = sum(user_score)
    print("Game stop!\n")
    print(f"Your total score: {sum_user}")
    print(f"Computer's total score: {sum_com}")
    if sum_user > sum_com:
      print("You win! Congratulation ✨")
    elif sum_user == sum_com:
      print("It's a tied match 🥊")
    else:
      print("You lost. Wanna give another try? 🔥")
    break
  else:
    print("Let's continue\n")

  i += 1





