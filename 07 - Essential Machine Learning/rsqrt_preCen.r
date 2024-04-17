
# Training with "Rsquared" metric
# Using preProcess = c("center", "scale")


library(tidyverse)
library(caret)
library(mlbench)
library(ggpubr)

# preview data
data(BostonHousing)
df <- BostonHousing
head(df)


# 1. split
train_test_split <- function(data, size){
  set.seed(42)
  n <- nrow(data)
  train_id <- sample(1:n, size = n*size)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return(list(train_df, test_df))
}

prep_df <- train_test_split(df, 0.8)


# I chose corr > 0.5

# 2. train

model_traincv = c()
model_trainloocv = c()
model_trainboot = c()
model_met = c("lm", "glm")
model_metcv = c("lm", "glm", "knn")


train_control = c()
train_method = c("cv", "LOOCV", "boot")



for (num in c(5,10)){
  train_control[["cv"]][[num]] <- trainControl(method = "cv",
                                               number = num,
                                               verboseIter = TRUE) # progress bar
  
}

train_control[["LOOCV"]] <- trainControl(method = "LOOCV")
train_control[["boot"]] <- trainControl(method = "boot")




# with train control cv
for(met in model_metcv){
  for(num in c(5,10)){
    model_traincv[[met]][[num]] <- train(medv ~ rm + ptratio + lstat,
                                         data = prep_df[[1]],
                                         method = met,
                                         metric = "Rsquared", 
                                         trControl = train_control$cv[[num]],
                                         preProcess = c("center", "scale"))
    
  }
}

# with train control loocv
for(met in model_met){
  model_trainloocv[[met]]<- train(medv ~ rm + ptratio + lstat,
                                  data = prep_df[[1]],
                                  method = met,
                                  metric = "Rsquared",
                                  trControl = train_control$LOOCV,
                                  preProcess = c("center", "scale"))
}

# with train control bootrap
for(met in model_met){
  model_trainboot[[met]] <- train(medv ~ rm + ptratio + lstat,
                                  data = prep_df[[1]],
                                  method = met,
                                  metric = "Rsquared",
                                  trControl = train_control$boot,
                                  preProcess = c("center", "scale"))
  
}


# 3. score

predict_cv = c()
predict_loocv = c()
predict_boot = c()

for(met in model_metcv){
  for(num in c(5,10)){
    predict_cv[[met]][[num]] <- predict(model_traincv[[met]][[num]], newdata = prep_df[[2]])
  }
}

for(met in model_met){
  predict_loocv[[met]] <- predict(model_trainloocv[[met]], newdata = prep_df[[2]])
  predict_boot[[met]] <- predict(model_trainboot[[met]], newdata = prep_df[[2]])
}


# 4. evaluate
post_cv = c()
post_loocv = c()
post_boot = c()


for(met in model_metcv){
  for(num in c(5,10)){
    post_cv[[met]][[num]] <- postResample(predict_cv[[met]][[num]], prep_df[[2]]$medv)
  }
}

for(met in model_met){
  post_loocv[[met]] <- postResample(predict_loocv[[met]], prep_df[[2]]$medv)
  post_boot[[met]] <- postResample(predict_boot[[met]], prep_df[[2]]$medv)
}



# write report of train model

sink("model_rsqrt_preCen.txt")

for (met in model_met) {
  print(model_trainboot[[met]])
  print(model_trainloocv[[met]])
  
}

for (met in model_metcv) {
  for(num in c(5,10)){
    print(model_traincv[[met]][[num]])
  }
}

sink()

# write report of prediction

sink("test_rsqrt_preCen.txt")

for(met in model_metcv){
  for(num in c(5,10)){
    cat("Resampling: CV", "\n")
    cat("Model: ", met, "\n")
    cat("Fold: ", num, "\n")
    cat(post_cv[[met]][[num]], "\n")
  }
}

for(met in model_met){
  cat("Resampling: LOOCV", "\n")
  cat("Model: ", met, "\n")
  cat(post_loocv[[met]], "\n")
  
  cat("Resampling: boot", "\n")
  cat("Model: ", met, "\n")
  cat(post_boot[[met]], "\n")
}

sink()





