
class Account():
  def __init__(self, acc_num, input_password):
    for user in user_data:
        if user["account number"] == acc_num and user["password"] == input_password:
          self.info = UserData(user)

  def update_name(self, newname):
    for member in user_data:
      if member["account number"] == self.info.account_number:
        member["name"] = newname
        self.info.name = newname
      else:
        pass
    print(f"Your account name was changed to {self.info.name}")

  def update_password(self, newpassword):
    for member in user_data:
      if member["account number"] == self.info.account_number:
        member["password"] = newpassword
        self.info.password = newpassword
      else:
        pass
    print(f"Your password has been changed successfully.")

