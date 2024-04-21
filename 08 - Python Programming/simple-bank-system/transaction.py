

class Transaction():
  def __init__(self, acc_num, input_password):
    for user in user_data:
      if user["account number"] == acc_num and user["password"] == input_password:
        self.info = UserData(user)

  def deposit(self, money):
    try:
      self.info.balance += money
      print(f"Account name: {self.info.name}\nAccount number: {self.info.account_number}\nDeposit money: {money}\nYour new balance: {self.info.balance}")
      print("Transaction successful")
    except:
      print("Something went wrong.\nTransaction failed")


  def withdraw(self, money):
    try:
      if self.info.balance >= money:
        self.info.balance -= money
        print(f"Account name: {self.info.name}\nAccount number: {self.info.account_number}\nWithdraw money: {money}\nYour new balance: {self.info.balance}")
        print("Transaction successful")
      else:
        print("You have not enough money.\nTransaction failed")
    except:
      print("Something went wrong.\nTransaction failed")

  def transfer(self, toacc_num, money):
    if self.info.balance >= money: # check if there is enough money
      for data in user_data:
        if data["account number"] == toacc_num:
          reciever = UserData(data)

          # payer
          self.info.balance -= money # update payer account
          print(f"Account name: {self.info.name}\nAccount number: {self.info.account_number}\nTransfer money: {money}\nYour new balance: {self.info.balance}")

          # reciever
          print(f"Recieving account name: {reciever.name}\nRecieving account number: {reciever.account_number}")

          # finally
          print("Transaction successful")
      else:
        pass
    else:
      print("You have not enough money.\nTransaction failed")

  def get_OTP(self):
    import random
    otp = random.randint(100000, 999999)
    print(f"Your OTP: {otp} This OTP will be available in the next 2 minutes.")



