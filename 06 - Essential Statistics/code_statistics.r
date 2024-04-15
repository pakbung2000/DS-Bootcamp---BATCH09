
### ESTIMATION

# Proportion, 1 population
# Specify sample occurrences (x), sample size (n)
x = 6
n = 30
confidence_level = 0.95

p = 6/30
q = 1-p

alpha = 1 - confidence_level
z_critical = qnorm(1-(alpha/2))
se = sqrt((p*q)/n)
moe = z_critical * se

lower_bound = p + moe
higher_bound = p - moe

sprintf("alpha: %0.3f", alpha)
sprintf("critcal z: %0.3f", z_critical)
sprintf("se: %0.3f", se)
sprintf("moe: %0.3f", moe)
sprintf("lower_bound: %0.3f", lower_bound)
sprintf("higher_bound: %0.3f", higher_bound)


# Mean, 1 population
# Specify sample mean (x_bar)
# sample standard deviation (s)
# sample size (n)

x_bar = 62.1
s = 13.46
n = 29
confidence_level = 0.95

alpha = 1 - confidence_level
df = n-1
t = qt(1-alpha/2, df)
se = s/sqrt(n)
moe = t*se

upper_bound = x_bar + moe
lower_bound = x_bar - moe

sprintf("alpha: %0.3f", alpha)
sprintf("critcal t: %0.3f", t)
sprintf("se: %0.3f", se)
sprintf("moe: %0.3f", moe)
sprintf("lower_bound: %0.3f", lower_bound)
sprintf("higher_bound: %0.3f", upper_bound)


### HYPOTHESIS TESTING

# P-value from right-tail proportion test at 0.05 significance level

# H0: p = 0.2
# Ha: p!= 0.2

x <- 10
n <- 40
p <- 0.20

p_value <- prop.test(x, n, p, 
          alternative = c("greater"), 
          conf.level = 0.95, correct = FALSE)$p.value

# We got p_value = 0.2145977
# From p_value > 0.05, therefore we failed to reject H0









