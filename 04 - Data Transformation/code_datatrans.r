

library(nycflights13)
library(dplyr)
library(rio)
data("flights")
data("airlines")
data("planes")
data("airports")
data("weather")


### Q1. number of flights of each airline in quarter 4

df1 <- flights %>%
  filter(month %in% c(9, 10, 11, 12)) %>%
  group_by(carrier) %>%
  summarise(count_flights = n()) %>%
  left_join(., airlines, by = "carrier") %>%
  select(carrier, name, count_flights) %>%
  arrange(desc(count_flights))

### Q2. average arrival delay of each airline

df2 <- flights %>%
  group_by(carrier) %>%
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(avg_delay) %>%
  left_join(., airlines, by = "carrier") %>%
  select(carrier, name, avg_delay)

### Q3. number of flights arrive at each airport

df3 <- flights %>%
  select(flight, faa = dest) %>%
  count(faa) %>%
  left_join(., airports, by = "faa") %>%
  select(name, count_arr_flights = n) %>%
  arrange(desc(count_arr_flights))
​
### Q4. top 3 destinations of each airline

df4 <- flights %>%
  group_by(carrier) %>%
  count(dest) %>%
  arrange(desc(n), .by_group = TRUE) %>%
  filter(row_number() %in% c(1, 2, 3)) %>%
  left_join(., airports, by = c("dest" = "faa")) %>%
  select(carrier, destination = dest, name, count_top3 = n)

### Q5. average of distance per hour of each engine

df5 <- flights %>%
  left_join(., planes, by = "tailnum") %>%
  filter(engine != "") %>%
  group_by(engine) %>%
  summarise(sum_dis = sum(distance, na.rm = TRUE),
            sum_hr = sum(hour, na.rm = TRUE)) %>%
  mutate(avg_dis_hr = sum_dis/sum_hr) %>%
  select(engine, avg_dis_hr) %>%
  arrange(desc(avg_dis_hr))

### Q6. average temperature at origins airports in a month, and count number of departure flights

prep_df6 <- flights %>%
  group_by(origin, month) %>%
  count(flight) %>%
  summarise(sum_flights = sum(n))

df6 <- weather %>%
  filter(temp != "") %>%
  select(origin, month, temp) %>%
  group_by(origin, month) %>%
  summarise(avg_temp = mean(temp)) %>%
  left_join(., prep_df6, by = c("origin", "month"))


### Q7 label the distance to very-short-haul, short-haul, medium-haul and long-haul
### count flights in each label

df7 <- flights %>% 
  mutate(distance_km = distance*1.60934) %>%
  mutate(flights_label = if_else(between(distance_km, 0, 500), "very-short-haul", 
                          if_else(between(distance_km, 501, 1500), "short-haul",
                          if_else(between(distance_km, 1501, 4000), "medium-haul","long-haul")))) %>%
  select(flights_label,flight) %>%
  count(flights_label)
​
### Q8. list airports that have state.name in airports' name

df8 <- filter(airports, grepl(paste(state.name, collapse='|'), airports$name)) %>%
  select(airport = faa, name)


### Write csv file

csv_list <- list(df1, df2, df3, df4, df5, df6, df7, df8)

export_list(csv_list, c("df1.csv", "df2.csv", "df3.csv", "df4.csv", "df5.csv",
                        "df6.csv", "df7.csv", "df8.csv"))









