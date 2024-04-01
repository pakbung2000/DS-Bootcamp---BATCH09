# Pizza chatbot

pizza_chatbot <- function(){

# USER INFO
  name <- readline("Hello. May I have your name?: ")
  phone <- readline("Enter your phone number: ")

# MENU TABLE
pizza_id <- c(1,2,3,4,5,6,7,8,9,10)

pizza_name <- c('Pepperoni Pizza', 'Vegetarian Pizza', 'Mushroom Pizza', 'BBQ Chicken Pizza', 'Cheese Pizza', 'Hawaiian Pizza', 'Pizza Margherita',
'Seafood pizza', 'Pizza capricciosa', 'Meat Lovers Pizza')

pizza_price <- c(159, 169, 169, 179, 189, 189, 219, 219, 219, 229)

menu <- data.frame(pizza_id ,pizza_name, pizza_price)

print(menu)


# ALL LISTS
user_order <- list()
quantity_order <- list()
cal_price <- list()
repeat_menu <- list()
repeat_quantity <- list()


# USER ORDER
i <- 1
while (i >= 1){
    flush.console()
    user_order[[i]] <- as.numeric(readline("Your order[pizza_id]: "))
    quantity_order[[i]] <- as.numeric(readline("Quantity of your pizza[enter number]: "))

    cal_price[[i]] = as.integer(menu[user_order[[i]], 3])*(quantity_order[[i]])

    want_more <- readline("Are there any menus you want to order?[y/n]: ")

# REPEAT ORDER
    if (want_more == "n"){
        cat("We would like to repeat your order again", "\n")

        for (i in 1:length(user_order)){
            repeat_menu[[i]] <- menu[user_order[[i]], 2]
            repeat_quantity[[i]] <- quantity_order[[i]]
                                      }
        all_repeat <- cbind(repeat_menu, repeat_quantity)

        print(as.data.frame(all_repeat))

# CALCULATE BILL
        total_price <- do.call(sum, cal_price)
        cat("User: ", name, "\nPhone number: ", phone, "\nTotal bill: ", total_price, "\nYour order will be arrived at your doorstep in 30 minutes or less")
        break
                        }

    print(menu)
    i = i+1
          }
}

pizza_chatbot()
