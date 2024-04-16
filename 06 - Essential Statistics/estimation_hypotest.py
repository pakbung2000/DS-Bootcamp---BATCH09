
import scipy.stats as stats
import math

### ESTIMATION

# 1. Proportion of one population 
# Two-tailed test

x = 6
n = 30
confidence_level = 0.95

p = 6/30
q = 1-p
alpha = 1-confidence_level
se = math.sqrt((p*q)/n)

z = stats.norm.ppf(1-(alpha/2))

higher_bound = round(p + (z*se), 3)
lower_bound = round(p - (z*se), 3)

print(f"p: {p}")
print(f"q: {q}")
print(f"alpha: {alpha}")
print(f"se: {se}")
print(f"z: {z}")
print(f"moe: {z*se}")
print(f"higher bound: {higher_bound}")
print(f"lower_bound: {lower_bound}")
print(f"confidence interval: [{lower_bound}, {higher_bound}]")


# 2. Mean of one population 
# Two-tailed test

x_bar = 62.1
s = 13.46
n = 29 # using t-score
confidence_level = 0.95

alpha = 1 - confidence_level
df = n - 1
t = stats.t.ppf((1-alpha/2), df)
se = s/math.sqrt(n)
moe = t*se

lower_bound = x_bar - moe
upper_bound = x_bar + moe

print(f"1-alpha/2: {1-alpha/2}")
print(f"t, df = 28: {t}")
print(f"se: {se}")
print(f"moe: {moe}")
print(f"lower_bound: {lower_bound}")
print(f"upper_bound: {upper_bound}")

### HYPOTHESIS TESTING

# 1. Proportion of one population
# Right-tailed test

# H0: p <= 0.2
# Ha: p > 0.2

x = 10
n = 40
pi = 0.2
sig_level = 0.05 # confident level = 0.95

p = 10/40
p_std = math.sqrt((pi*(1-pi))/n)

p_value = ((p-pi)/p_std)
critical_value = stats.norm.ppf(0.95)

# p_value = 0.7905694150420945
# critical_value = 1.6448536269514722
# Since p_value < critical_value, we failed to reject H0
# We concluded that p <= 0.2

# 2. Mean of one population
# Two-tailed test

# H0: mu = 200
# Ha: mu != 200

x_bar = 172.5
s = 119.5
mu_null = 200
n = 40
alpha = 0.01 # alpha/2 = 0.005

z_score = (x_bar - mu_null)/(s/math.sqrt(n))
p_value = stats.norm.cdf(z_score)

# p_value = 0.07277352327093886
# Since p_value > 0.005, we failed to reject H0
# We concluded that mu = 200










