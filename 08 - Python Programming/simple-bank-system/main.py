

print("user1 would like to deposit and tranfer money:")
user1 = Transaction(101, "kaworukungsocool")
user1.deposit(20)
user1.transfer(103, 200)

print("\nuser2 would like to update account name and password:")
user2 = Account(102, "agrressivesometimes123")
user2.update_name("Asuka Langley Soryu")
user2.update_password("formyself_from_now_on123")

print("\nuser3 would like to withdraw money:")
user3 = Transaction(100, "nothingjustmeowmeow00")
user3.withdraw(800)

print("\nuser4 would like to get OTP:")
user4 = Transaction(103, "ikarikungsocute")
user4.get_OTP()

