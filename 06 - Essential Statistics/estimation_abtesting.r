
### ESTIMATION

# 1. Proportion of one population
# Two-tailed test
x = 6
n = 30
confidence_level = 0.95

p = 6/30
q = 1-p

alpha = 1 - confidence_level
z_score = qnorm(1-(alpha/2))
se = sqrt((p*q)/n)
moe = z_score * se

lower_bound = p + moe
higher_bound = p - moe

sprintf("alpha: %0.3f", alpha)
sprintf("z-score: %0.3f", z_score)
sprintf("se: %0.3f", se)
sprintf("moe: %0.3f", moe)
sprintf("lower_bound: %0.3f", lower_bound)
sprintf("higher_bound: %0.3f", higher_bound)


# 2. Mean of one population
# Two-tailed test

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
sprintf("t-score: %0.3f", t)
sprintf("se: %0.3f", se)
sprintf("moe: %0.3f", moe)
sprintf("lower_bound: %0.3f", lower_bound)
sprintf("higher_bound: %0.3f", upper_bound)


### HYPOTHESIS TESTING

# 1. Right-tailed proportion test 
# At 5% significance level

# H0: p >= 0.2
# Ha: p < 0.2

x <- 10
n <- 40
p <- 0.20

p_value <- prop.test(x, n, p, 
          alternative = c("greater"), 
          conf.level = 0.95, correct = FALSE)$p.value

# p_value = 0.2145977
# From p_value > 0.05, therefore we failed to reject H0
# We concluded taht p >= 0.2


# 2. Right-tailed mean test
# At 5% significance level

# H0: mu >= 55
# Ha: mu < 55

x_bar <- 62.1
s <- 13.46
mu_null <- 55
n <- 32

z_score <- (x_bar - mu_null)/(s/sqrt(n))
p_value <- 1 - pnorm(z_score)

# p_value = 0.001422871
# From p-value < 0.05, therefore we rejected H0
# We concluded that mu >= 55











