

user_data = [{"name": "Rei", "account number": 100, "password": "nothingjustmeowmeow00", "balance": 700},
            {"name": "Shinji", "account number": 101, "password": "kaworukungsocool", "balance": 500},
             {"name": "Asuka", "account number": 102, "password": "agrressivesometimes123", "balance": 500},
             {"name": "Kaworu", "account number": 103, "password": "ikarikungsocute", "balance": 1000},
             ]

class UserData():
  def __init__(self, dictionary):
    self.name = dictionary["name"]
    self.account_number = dictionary["account number"]
    self.password = dictionary["password"]
    self.balance = dictionary["balance"]

