

library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggpubr)
library(patchwork)


### Q1
# Transmissions & Avg City Miles
# Transmissions & Avg Highway Miles
# 1999 vs 2008


cty_1999 <- mpg %>% 
  filter(year==1999) %>%
  select(trans, cty) %>%
  group_by(trans) %>%
  summarise(avg_cty = mean(cty)) %>%
  ggplot(., aes(x=trans, y=avg_cty, fill=trans))+
  geom_col()+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(
    subtitle = "1999",
    fill = "Tranmissions")+
  coord_cartesian(ylim = c(0, 25))


cty_2008 <- mpg %>% 
  filter(year==2008) %>%
  select(trans, cty) %>%
  group_by(trans) %>%
  summarise(avg_cty = mean(cty)) %>%
  ggplot(., aes(x=trans, y=avg_cty, fill=trans))+
  geom_col()+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(
    subtitle = "2008",
    fill = "Tranmissions") +
  coord_cartesian(ylim = c(0, 25))


hwy_1999 <- mpg %>% 
  filter(year==1999) %>%
  select(trans, hwy) %>%
  group_by(trans) %>%
  summarise(avg_hwy = mean(hwy)) %>%
  ggplot(., aes(x=trans, y=avg_hwy, fill=trans))+
  geom_col()+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(
    subtitle = "1999",
    fill = "Tranmissions")+
  coord_cartesian(ylim = c(0, 30))


hwy_2008 <- mpg %>% 
  filter(year==2008) %>%
  select(trans, hwy) %>%
  group_by(trans) %>%
  summarise(avg_hwy = mean(hwy)) %>%
  ggplot(., aes(x=trans, y=avg_hwy, fill=trans))+
  geom_col()+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(
    subtitle = "2008",
    fill = "Tranmissions")+
  coord_cartesian(ylim = c(0, 30))

cty_all <- ggarrange(cty_2008, 
                     cty_1999,
                     common.legend = TRUE,
                     legend = "right",
                     widths = c(1.5, 1))

cty_final <- annotate_figure(cty_all,
                             top = text_grob("Tranmissions and Average City Miles",
                             size = 12))


hwy_all <- ggarrange(hwy_2008, 
                     hwy_1999,
                     common.legend = TRUE,
                     legend = "right",
                     widths = c(1.5, 1))

hwy_final <- annotate_figure(cty_all,
                             top = text_grob("Tranmissions and Average Highway Miles",
                                             size = 12))



### Q2
# Fuel type & Average Displacement in 1999
# Fuel type & Average Displacement in 2008
# Separate by Number of Cylinders

q2_1999 <- mpg %>%
  filter(year == 1999) %>%
  select(fl, cyl, displ) %>%
  group_by(fl, cyl) %>%
  summarise(mean_displ = mean(displ), .groups = "keep") %>%
  ggplot(., aes(x = fl, y = mean_displ, fill = factor(cyl))) +
  geom_col(position = position_dodge2(preserve = "single"))+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(
    subtitle = "1999",
    x = "Fuel type",
    fill = "Cylinders")+
  coord_cartesian(ylim = c(0, 5))
  


q2_2008 <- mpg %>%
  filter(year == 2008) %>%
  select(fl, cyl, displ) %>%
  group_by(fl, cyl) %>%
  summarise(mean_displ = mean(displ), .groups = "keep") %>%
  ggplot(., aes(x = fl, y = mean_displ, fill = factor(cyl))) +
  geom_col(position = position_dodge2(preserve = "single"))+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(
    subtitle = "2008",
    x = "Fuel type",
    fill = "Cylinders")+
  coord_cartesian(ylim = c(0, 5))

q2_all <- ggarrange(q2_2008, q2_1999,
                   common.legend = TRUE, 
                   legend = "right", 
                   ncol = 2)

q2_final <- annotate_figure(q2_all,
                            top = text_grob("Fuel type and Average Displacement", 
                            size = 12))



### Q3
# Driven Train & Engine Displacement
# 1999 vs 2008

q3_1999 <- mpg %>%
  filter(year==1999) %>%
  ggplot(., aes(x=drv, y=displ, fill = drv))+
  geom_boxplot()+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(subtitle = "1999",
       fill = "Driven Trains")

q3_2008 <- mpg %>%
  filter(year==2008) %>%
  ggplot(., aes(x=drv, y=displ, fill = drv))+
  geom_boxplot()+
  theme_minimal()+
  scale_fill_brewer(palette = "Set3")+
  labs(subtitle = "2008",
       fill = "Driven Trains")

q3_all <- ggarrange(q3_2008,
                    q3_1999,
                    ncol = 2,
                    common.legend = TRUE,
                    legend = "bottom")

q3_final <- annotate_figure(q3_all,
                            top = text_grob("Driven Train and Engine Displacement",
                            size = 12))

### Q4
# Engine Displacement and City Miles
# Engine Displacement and Highway Miles
# Separate by Driven trains

q4_cty <- mpg %>%
  ggplot(., aes(x=displ, y=cty, color = drv)) +
  geom_point(size=2.5)+
  geom_smooth( method = "lm", 
            formula = 'y ~ x', 
            se=TRUE,
            fill = "#d1d1d1") +
  scale_colour_brewer(palette = "Set2")+
  theme_minimal()+
  labs(title = "Engine Displacement and City Miles",
       subtitle = "2008 and 1999")

q4_hwy <- mpg %>%
  ggplot(., aes(x=displ, y=hwy, color = drv)) +
  geom_point(size=2.5)+
  geom_smooth( method = "lm", 
               formula = 'y ~ x', 
               se=TRUE,
               fill = "#d1d1d1") +
  scale_colour_brewer(palette = "Set2")+
  theme_minimal()+
  labs(title = "Engine Displacement and Highway Miles",
       subtitle = "2008 and 1999")


q4_final <- ggarrange(q4_cty, 
                      q4_hwy,
                      common.legend = TRUE,
                      legend = "right")


### Q5
# Manufacturers and Classes
# 1999 vs 2008


q5_1999 <- mpg %>%
  filter(year == 1999) %>%
  select(manufacturer, class, year) %>%
  group_by(manufacturer, class) %>%
  summarise(n = n(), .groups = "keep") %>%
  ggplot(., aes(x = manufacturer , y = n, fill = class)) +
  scale_fill_brewer(palette = "Set2") +
  geom_col() +
  theme_minimal()+
  labs(
    subtitle = "1999")+
  coord_cartesian(ylim = c(0, 23))

q5_2008 <- mpg %>%
  filter(year == 2008) %>%
  select(manufacturer, class, year) %>%
  group_by(manufacturer, class) %>%
  summarise(n = n(), .groups = "keep") %>%
  ggplot(., aes(x = manufacturer , y = n, fill = class)) +
  scale_fill_brewer(palette = "Set2") +
  geom_col() +
  theme_minimal()+
  labs(
    subtitle = "2008")+
  coord_cartesian(ylim = c(0, 23))


q5_all <- ggarrange(q5_2008, q5_1999, common.legend = TRUE, legend = "top", ncol = 2)

q5_final <- annotate_figure(q5_all, 
                            top = text_grob("Manufacturer and Numbers of Class",
                                               size = 12))



