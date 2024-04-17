
library(dplyr)

# Check correlation
corMat <- mtcars %>%
  select(mpg, wt, hp, am) %>%
  cor()

# Fitting linear models
lmfit <- lm(mpg ~ hp + wt + am, data = mtcars)
coefs <- coef(lmfit)

# Example of predicting target (mpg column)
coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1


