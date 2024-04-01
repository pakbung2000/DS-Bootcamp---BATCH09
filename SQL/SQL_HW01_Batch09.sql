-- Create Table

-- Table 1 customer_info

DROP TABLE IF EXISTS customer_info;

CREATE TABLE customer_info (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    fullname TEXT NOT NULL,
    address TEXT NOT NULL,
    phone TEXT,
    point REAL NOT NULL
  );

-- Table 2 customer_order
DROP TABLE IF EXISTS customer_order;

CREATE TABLE customer_order (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INT NOT NULL, 
    orderdate DATE NOT NULL,
    pizza_order TEXT NOT NULL,
   size_order TEXT NOT NULL
); 

-- Table 3 pizza
DROP TABLE IF EXISTS pizza;

CREATE TABLE pizza (
        pizza_id INTEGER PRIMARY KEY AUTOINCREMENT,
        pizza_name TEXT NOT NULL,
        price_unit REAL NOT NULL
  ); 

-- Table 4 pizza_size
DROP TABLE IF EXISTS pizza_size;

CREATE TABLE IF NOT EXISTS pizza_size (
  size_id INTEGER PRIMARY KEY AUTOINCREMENT,
  size_name TEXT NOT NULL,
  price_size REAL NOT NULL
);

-- Insert Table

-- Table 1 customer_info
INSERT INTO customer_info (fullname, address, phone, point) VALUES
  ('John Smith', '123 Main St.', '555-1234', 0),
  ('Jane Doe', '456 Maple Ave.', '555-5678', 0),
  ('Bob Johnson', '789 Oak St.', '555-9012', 0),
  ('Alice Lee', '321 Pine Rd.', '555-3456', 0),
  ('Tom Brown', '654 Cedar St.', '555-7890', 0),
  ('Sarah Williams', '987 Elm St.', '555-2345', 0),
  ('Mike Davis', '321 Pine Rd.', '555-6789', 0),
  ('Emily Thompson', '654 Cedar St.', '555-0123', 0),
  ('David Kim', '987 Elm St.', '555-4567', 0),
  ('Samantha Taylor', '321 Pine Rd.', '555-7890', 0);

  -- Table 2 customer_order
INSERT INTO customer_order (customer_id, orderdate, pizza_order, size_order) VALUES
(7, '2023-01-01', 'Pepperoni Pizza', 'Small'),
(2, '2023-01-01', 'Cheese Pizza', 'Medium'),
(3, '2023-01-01', 'Seafood pizza', 'Large'),
(6, '2023-01-02', 'Meat Lovers Pizza', 'Extra Large'),
(9, '2023-01-02', 'Cheese Pizza', 'Medium'),
(10, '2023-01-02', 'Mushroom Pizza','Small'),
(4, '2023-01-03', 'Pepperoni Pizza', 'Large'),
(5, '2023-01-04', 'Cheese Pizza', 'Medium'),
(9, '2023-01-04', 'Vegetarian Pizza', 'Medium'),
(10, '2023-01-04', 'Pizza Margherita', 'Small'),
(8, '2023-01-05', 'Cheese Pizza', 'Extra Large'),
(1, '2023-01-05', 'BBQ Chicken Pizza', 'Large'),
(7, '2023-01-06', 'Pepperoni Pizza', 'Extra Large'),
(6, '2023-01-06', 'BBQ Chicken Pizza', 'Large'),
(5, '2023-01-07', 'Meat Lovers Pizza', 'Medium'),
(3, '2023-01-07', 'Pizza capricciosa', 'Small'),
(7, '2023-01-08', 'Cheese Pizza', 'Medium'),
(8, '2023-01-09', 'Hawaiian Pizza', 'Large'),
(9, '2023-01-10', 'Pizza Margherita', 'Extra Large'),
(10, '2023-01-10', 'Seafood pizza', 'Medium'),
(1, '2023-01-11', 'BBQ Chicken Pizza', 'Large'),
(4, '2023-01-12', 'Cheese Pizza', 'Medium'),
(5, '2023-01-13', 'Pizza Margherita', 'Large'),
(6, '2023-01-14', 'Mushroom Pizza', 'Small'),
(7, '2023-01-15', 'Pizza Margherita', 'Large'),
(8, '2023-01-16', 'Vegetarian Pizza', 'Medium'),
(9, '2023-01-17', 'Pizza capricciosa', 'Large'),
(10, '2023-01-18', 'Pepperoni Pizza', 'Extra Large'),
(1, '2023-01-19', 'Pizza Margherita', 'Small'),
(7, '2023-01-20', 'Meat Lovers Pizza', 'Medium'),
(3, '2023-01-21', 'Pizza capricciosa', 'Extra Large'),
(6, '2023-01-22','Pepperoni Pizza', 'Medium'),
(5, '2023-01-23', 'Meat Lovers Pizza', 'Large'),
(9, '2023-01-24', 'Mushroom Pizza', 'Small'),
(8, '2023-01-25', 'Pizza Margherita', 'Large'),
(8, '2023-01-26', 'Vegetarian Pizza', 'Medium'),
(9, '2023-01-27', 'Meat Lovers Pizza', 'Large'),
(10, '2023-01-28', 'Pizza capricciosa', 'Medium'),
(10, '2023-01-29', 'Mushroom Pizza', 'Large'),
(2, '2023-01-30', 'Pizza Margherita', 'Small'),
(5, '2023-01-31', 'Seafood pizza', 'Extra Large'),
(4, '2023-02-01', 'Hawaiian Pizza', 'Medium'),
(7, '2023-02-02', 'Cheese Pizza', 'Medium'),
(8, '2023-02-03', 'Pizza Margherita', 'Extra Large'),
(9, '2023-02-04', 'Hawaiian Pizza', 'Medium'),
(10, '2023-02-05', 'Pizza Margherita', 'Large'),
(1, '2023-02-06', 'Pepperoni Pizza', 'Medium'),
(2, '2023-02-07', 'Meat Lovers Pizza', 'Large'),
(9, '2023-02-08', 'Seafood pizza', 'Large'),
(6, '2023-02-09', 'Mushroom Pizza', 'Small'),
(5, '2023-02-10', 'Pepperoni Pizza', 'Large'),
(7, '2023-02-11', 'BBQ Chicken Pizza', 'Large'),
(8, '2023-02-12', 'Vegetarian Pizza', 'Extra Large'),
(9, '2023-02-13', 'Meat Lovers Pizza', 'Large'),
(10, '2023-02-14', 'Pizza capricciosa', 'Medium'),
(1, '2023-02-15', 'Cheese Pizza', 'Small'),
(4, '2023-02-15', 'Mushroom Pizza', 'Medium'),
(5, '2023-02-16', 'Pizza Margherita', 'Small'),
(6, '2023-02-17', 'Pepperoni Pizza', 'Large'),
(7, '2023-02-18', 'Seafood pizza', 'Small'),
(8, '2023-02-18', 'Hawaiian Pizza', 'Medium'),
(9, '2023-02-18', 'Vegetarian Pizza', 'Large'),
(10, '2023-02-19', 'Cheese Pizza', 'Extra Large'),
(1, '2023-02-20', 'Cheese Pizza', 'Large'),
(2, '2023-02-21', 'Mushroom Pizza', 'Small'),
(4, '2023-02-22', 'Pepperoni Pizza', 'Large'),
(4, '2023-02-22', 'Seafood pizza', 'Large'),
(8, '2023-02-23', 'Vegetarian Pizza', 'Small'),
(9, '2023-02-24', 'Hawaiian Pizza', 'Medium'),
(7, '2023-02-24', 'Pepperoni Pizza', 'Medium'),
(10, '2023-02-25', 'Pizza Margherita', 'Large'),
(9, '2023-02-06', 'Mushroom Pizza', 'Extra Large'),
(10, '2023-02-27', 'Hawaiian Pizza', 'Large'),
(1, '2023-02-28', 'Mushroom Pizza', 'Medium'),
(3, '2023-02-29', 'Meat Lovers Pizza', 'Small'),
(5, '2023-03-01', 'Pepperoni Pizza', 'Large'),
(4, '2023-03-02', 'Vegetarian Pizza', 'Small'),
(6, '2023-03-03', 'Seafood pizza', 'Large'),
(8, '2023-03-04', 'Mushroom Pizza', 'Large'),
(7, '2023-03-05', 'BBQ Chicken Pizza', 'Medium'),
(8, '2023-03-06', 'Pepperoni Pizza', 'Small'),
(2, '2023-03-07', 'Pizza capricciosa', 'Large'),
(1, '2023-03-08', 'Vegetarian Pizza','Extra Large'),
(1, '2023-03-09', 'Mushroom Pizza', 'Large'),
(2, '2023-03-10', 'BBQ Chicken Pizza', 'Small'),
(3, '2023-03-11', 'Seafood pizza', 'Large'),
(5, '2023-03-12', 'Pizza Margherita', 'Large'),
(5, '2023-03-13', 'Pepperoni Pizza', 'Medium'),
(8, '2023-03-14', 'Pizza Margherita', 'Small'),
(7, '2023-03-15', 'Mushroom Pizza', 'Large'),
(9, '2023-03-16', 'Meat Lovers Pizza', 'Medium'),
(9, '2023-03-17', 'BBQ Chicken Pizza', 'Large'),
(10, '2023-03-18', 'Cheese Pizza', 'Small'),
(1, '2023-03-19', 'Vegetarian Pizza', 'Large'),
(3, '2023-03-20', 'BBQ Chicken Pizza', 'Small'),
(7, '2023-03-21', 'Seafood pizza', 'Large'),
(4, '2023-03-22', 'Hawaiian Pizza', 'Large'),
(5, '2023-03-23', 'Cheese Pizza', 'Extra Large'),
(6, '2023-03-24', 'Pizza capricciosa', 'Large'),
(4, '2023-03-25', 'Hawaiian Pizza', 'Large'),
(8, '2023-03-26', 'Mushroom Pizza', 'Medium'),
(9, '2023-03-27', 'Pepperoni Pizza', 'Medium'),
(10, '2023-03-28', 'Meat Lovers Pizza', 'Small'),
(1, '2023-03-29', 'Hawaiian Pizza', 'Large'),
(2, '2023-03-30', 'Vegetarian Pizza', 'Small'),
(3, '2023-03-31', 'BBQ Chicken Pizza', 'Small'),
(2, '2023-04-01', 'Cheese Pizza', 'Extra Large'),
(5, '2023-04-02', 'Cheese Pizza', 'Small'),
(3, '2023-04-03', 'Hawaiian Pizza', 'Medium'),
(7, '2023-04-04', 'Pepperoni Pizza', 'Large'),
(8, '2023-04-05', 'Seafood pizza', 'Large'),
(2, '2023-04-06', 'Pizza Margherita', 'Large'),
(10, '2023-04-07', 'Mushroom Pizza', 'Small'),
(1, '2023-04-08', 'Pizza capricciosa', 'Medium'),
(2, '2023-04-09', 'Meat Lovers Pizza', 'Large'),
(3, '2023-04-10', 'Vegetarian Pizza', 'Medium'),
(8, '2023-04-11', 'Hawaiian Pizza', 'Extra Large'),
(5, '2023-04-12', 'Cheese Pizza', 'Large'),
(7, '2023-04-13', 'Vegetarian Pizza', 'Large'),
(3, '2023-04-14', 'Pepperoni Pizza', 'Medium'),
(6, '2023-04-15', 'Meat Lovers Pizza', 'Large'),
(9, '2023-04-16', 'Seafood pizza', 'Large'),
(1, '2023-04-17', 'Pizza Margherita', 'Large'),
(1, '2023-04-18', 'BBQ Chicken Pizza', 'Medium'),
(2, '2023-04-19', 'Pizza capricciosa', 'Medium'),
(3, '2023-04-20', 'Meat Lovers Pizza', 'Large'),
(2, '2023-04-21', 'Cheese Pizza', 'Medium'),
(5, '2023-04-22', 'Hawaiian Pizza', 'Medium'),
(7, '2023-04-23', 'Cheese Pizza', 'Extra Large'),
(3, '2023-04-24', 'Pizza Margherita', 'Small'),
(4, '2023-04-25', 'Seafood pizza', 'Large'),
(2, '2023-04-26', 'Pepperoni Pizza', 'Large'),
(10, '2023-04-27', 'Mushroom Pizza', 'Large'),
(1, '2023-04-28', 'Pepperoni Pizza', 'Medium'),
(8, '2023-04-29', 'Meat Lovers Pizza', 'Large'),
(3, '2023-04-30', 'Pizza capricciosa', 'Medium'),
(4, '2023-05-01', 'Hawaiian Pizza', 'Large'),
(2, '2023-05-02', 'Cheese Pizza', 'Small'),
(3, '2023-05-03', 'Pizza Margherita', 'Extra Large'),
(7, '2023-05-04', 'Seafood pizza', 'Large'),
(8, '2023-05-05', 'Cheese Pizza', 'Medium'),
(9, '2023-05-06', 'Meat Lovers Pizza', 'Large'),
(10, '2023-05-07', 'BBQ Chicken Pizza', 'Medium'),
(1, '2023-05-08', 'Pizza capricciosa', 'Medium'),
(2, '2023-05-09', 'Hawaiian Pizza', 'Medium'),
(8, '2023-05-10', 'Cheese Pizza', 'Small'),
(4, '2023-05-11', 'Pepperoni Pizza', 'Large'),
(5, '2023-05-12', 'Seafood pizza', 'Extra Large'),
(6, '2023-05-13', 'Vegetarian Pizza', 'Large'),
(1, '2023-05-14', 'Meat Lovers Pizza', 'Large'),
(8, '2023-05-15', 'BBQ Chicken Pizza', 'Large'),
(9, '2023-05-16', 'Pepperoni Pizza', 'Medium'),
(10, '2023-05-17', 'Hawaiian Pizza', 'Extra Large'),
(1, '2023-05-18', 'Cheese Pizza', 'Small'),
(2, '2023-05-19', 'Cheese Pizza', 'Small'),
(3, '2023-05-20', 'Seafood pizza', 'Large'),
(8, '2023-05-21', 'Pizza capricciosa', 'Medium'),
(5, '2023-05-22', 'Meat Lovers Pizza', 'Extra Large'),
(8, '2023-05-23', 'Hawaiian Pizza', 'Medium'),
(7, '2023-05-24', 'Cheese Pizza', 'Large'),
(8, '2023-05-25', 'Pizza Margherita', 'Small'),
(9, '2023-05-26', 'Seafood pizza', 'Large'),
(10, '2023-05-27', 'Pizza capricciosa', 'Medium'),
(1, '2023-05-28', 'Meat Lovers Pizza', 'Extra Large'),
(9, '2023-05-29', 'BBQ Chicken Pizza', 'Small'),
(3, '2023-05-30', 'Mushroom Pizza', 'Medium'),
(4, '2023-05-31', 'Hawaiian Pizza', 'Medium'),
(3, '2023-06-01', 'Cheese Pizza', 'Small'),
(2, '2023-06-02', 'Pepperoni Pizza', 'Small'),
(4, '2023-06-03', 'Seafood pizza', 'Large'),
(8, '2023-06-04', 'Cheese Pizza', 'Medium'),
(3, '2023-06-05', 'Mushroom Pizza', 'Large'),
(10, '2023-06-06', 'BBQ Chicken Pizza', 'Medium'),
(1, '2023-06-07', 'Pizza capricciosa', 'Extra Large'),
(2, '2023-06-08', 'Hawaiian Pizza', 'Medium'),
(7, '2023-06-09', 'Cheese Pizza', 'Small'),
(6, '2023-06-10', 'Pepperoni Pizza', 'Large'),
(5, '2023-06-11', 'Seafood pizza', 'Large'),
(6, '2023-06-12', 'Vegetarian Pizza', 'Extra Large'),
(7, '2023-06-13', 'Meat Lovers Pizza', 'Large'),
(8, '2023-06-14', 'BBQ Chicken Pizza', 'Large'),
(9, '2023-06-15', 'Pepperoni Pizza', 'Medium'),
(10, '2023-06-16', 'Hawaiian Pizza', 'Extra Large'),
(1, '2023-06-17', 'Pepperoni Pizza', 'Small'),
(9, '2023-06-18', 'Pizza Margherita', 'Small'),
(4, '2023-06-19', 'Seafood pizza', 'Large'),
(4, '2023-06-20', 'Pepperoni Pizza', 'Medium'),
(5, '2023-06-21', 'Mushroom Pizza', 'Large'),
(1, '2023-06-22', 'Hawaiian Pizza', 'Medium'),
(7, '2023-06-23', 'Cheese Pizza', 'Large'),
(8, '2023-06-24', 'Pizza Margherita', 'Small'),
(2, '2023-06-25', 'Seafood pizza', 'Large'),
(10, '2023-06-26', 'Pizza capricciosa', 'Medium'),
(1, '2023-06-27', 'Meat Lovers Pizza', 'Extra Large'),
(6, '2023-06-28', 'BBQ Chicken Pizza', 'Small'),
(5, '2023-06-29', 'Pepperoni Pizza', 'Medium'),
(4, '2023-06-30', 'Hawaiian Pizza', 'Extra Large');

  -- Table 3 pizza
INSERT INTO pizza (pizza_name, price_unit) VALUES
('Pepperoni Pizza', 159),
('Vegetarian Pizza', 169),
('Mushroom Pizza', 169),
('BBQ Chicken Pizza', 179),
('Cheese Pizza', 189),
('Hawaiian Pizza', 189),
('Pizza Margherita', 219),
('Seafood pizza', 219),
('Pizza capricciosa', 219),
('Meat Lovers Pizza', 229);

  -- Table 4 pizza_size
INSERT INTO pizza_size (size_name, price_size) VALUES 
  ('Small', 0),
  ('Medium', 75),
  ('Large', 150),
  ('Extra Large', 250);

-- query

--- The total selling price of each pizza from January to June
.shell printf '\e[0;32mThe total selling price of each pizza from January to June\e[0m\n'
  
WITH A AS (
    SELECT order_id,
        pizza_order,
        price_unit + price_size AS bill_total
  FROM customer_order AS co
    JOIN pizza ON co.pizza_order = pizza.pizza_name
      JOIN pizza_size AS ps on co.size_order = ps.size_name
      )

SELECT pizza_order AS 'Menu',
    SUM(bill_total) AS 'Total selling price'
FROM A
GROUP BY 1
ORDER BY 2 DESC;

--- The total selling price of each pizza of each month
.shell printf '\e[0;32mThe total selling price of each pizza of each month\e[0m\n'

 WITH B AS (
        SELECT 	
            pizza_order,
            price_unit + price_size AS bill_total,
            CASE
                WHEN STRFTIME("%m", orderdate) = "01" THEN "January"
                WHEN STRFTIME("%m", orderdate) = "02" THEN "Febuary"
                WHEN STRFTIME("%m", orderdate) = "03" THEN "March"
                WHEN STRFTIME("%m", orderdate) = "04" THEN "April"
                WHEN STRFTIME("%m", orderdate) = "05" THEN "May"
                WHEN STRFTIME("%m", orderdate) = "06" THEN "June"
            END AS Month
      FROM customer_order AS co
    JOIN pizza ON co.pizza_order = pizza.pizza_name
      JOIN pizza_size AS ps on co.size_order = ps.size_name 
      GROUP BY 1, STRFTIME("%m", orderdate)
            )

SELECT pizza_order AS 'Menu',
    bill_total AS 'Total selling price',
        Month
FROM B;

--- Top spender of each month
.shell printf '\e[0;32mTop spender of each month\e[0m\n'

 WITH C AS (
        SELECT 	
            fullname,
            orderdate,
            SUM(price_unit + price_size) AS bills_month
      FROM customer_info AS ci
      JOIN customer_order AS co ON ci.customer_id = co.customer_id
    JOIN pizza ON co.pizza_order = pizza.pizza_name
      JOIN pizza_size AS ps on co.size_order = ps.size_name 
      GROUP BY 1, STRFTIME("%m", orderdate)
            )

SELECT
    fullname AS 'The top spender',
    MAX(bills_month),
        CASE
            WHEN STRFTIME("%m", orderdate) = "01" THEN "January"
          WHEN STRFTIME("%m", orderdate) = "02" THEN "Febuary"
          WHEN STRFTIME("%m", orderdate) = "03" THEN "March"
          WHEN STRFTIME("%m", orderdate) = "04" THEN "April"
          WHEN STRFTIME("%m", orderdate) = "05" THEN "May"
          WHEN STRFTIME("%m", orderdate) = "06" THEN "June"
      END AS Month
FROM C
GROUP BY STRFTIME("%m", orderdate)
ORDER BY STRFTIME("%m", orderdate);

--- The best selling size of each month
.shell printf '\e[0;32mThe best selling size of each month\e[0m\n'

WITH D AS (
      SELECT orderdate,
        size_order, 
            COUNT(order_id) AS count_order
    FROM customer_order
    GROUP BY size_order, STRFTIME("%m", orderdate)
    ORDER BY 1, 3
           )

SELECT 
    CASE
          WHEN STRFTIME("%m", orderdate) = "01" THEN "January"
          WHEN STRFTIME("%m", orderdate) = "02" THEN "Febuary"
          WHEN STRFTIME("%m", orderdate) = "03" THEN "March"
          WHEN STRFTIME("%m", orderdate) = "04" THEN "April"
          WHEN STRFTIME("%m", orderdate) = "05" THEN "May"
          WHEN STRFTIME("%m", orderdate) = "06" THEN "June"
      END AS Month,
    size_order, 
        MAX(count_order)
FROM D
GROUP BY STRFTIME("%m", orderdate)
ORDER BY STRFTIME("%m", orderdate), 
    MAX(count_order);

-- Top 3 menu customers bought
.shell printf '\e[0;32mTop 3 menu customers bought\e[0m\n'

with E AS (
    SELECT fullname,
        pizza_order,
          COUNT(pizza_order) as total_order,
                RANK() over (PARTITION BY fullname ORDER BY COUNT(pizza_order) DESC) as top_rank
    FROM customer_info AS ci
    JOIN customer_order AS co ON ci.customer_id = co.customer_id
    GROUP BY 1,2
    ORDER BY 1,3 DESC)

SELECT fullname,
    pizza_order,
        total_order
from E
where top_rank <= 3;

--- Supposing, the restuarant will count points from now on
--- Counting from January to the present
--- If points >= 7000, then reward
.shell printf '\e[0;32mReward if points are greater than 7000\e[0m\n'


SELECT co.customer_id,
        fullname,
        SUM(price_unit + price_size) AS bills_total,
       CASE 
          WHEN SUM(price_unit + price_size) >= 7000 THEN "Yes"
          WHEN SUM(price_unit + price_size) < 7000 THEN "Not yet"
       END AS 'Reward'
  FROM customer_info AS ci
      JOIN customer_order AS co ON ci.customer_id = co.customer_id
    JOIN pizza ON co.pizza_order = pizza.pizza_name
      JOIN pizza_size AS ps on co.size_order = ps.size_name
    GROUP BY 1;

--- Percentage each pizza sold
.shell printf '\e[0;32mPercentage each pizza sold\e[0m\n'

WITH F AS (
    select pizza_order ,
    CAST(COUNT(order_id) AS REAL) AS count_each_pizza
  from customer_order AS co
  Join customer_info AS ci ON co.customer_id = ci.customer_id
  GROUP BY pizza_order)


SELECT pizza_order,
  ROUND(count_each_pizza/(SELECT count(order_id) FROM customer_order)*100, 2) AS percentage
FROM F;

