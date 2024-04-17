

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

corMat <-  df %>%
  select(crim, zn, indus, nox, 
  rm, age, dis, rad, tax, ptratio, 
  b, lstat, medv) %>%
  cor()

corMat 

# I chose columns that |corr| > 0.5 for training

# 2. train

model_traincv = c()
model_trainloocv = c()
model_trainboot = c()
model_met = c("lm", "glm")
model_metcv = c("lm", "glm", "knn")  # knn for k-fold cross validation


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
                                         metric = "RMSE", 
                                         trControl = train_control$cv[[num]])
    
  }
}

# with train control loocv
for(met in model_met){
  model_trainloocv[[met]]<- train(medv ~ rm + ptratio + lstat,
                                  data = prep_df[[1]],
                                  method = met,
                                  metric = "RMSE",
                                  trControl = train_control$LOOCV)
}

# with train control bootrap
for(met in model_met){
  model_trainboot[[met]] <- train(medv ~ rm + ptratio + lstat,
                                  data = prep_df[[1]],
                                  method = met,
                                  metric = "RMSE",
                                  trControl = train_control$boot)
  
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
  post_loocv[[met]][[num]] <- postResample(predict_cv[[met]][[num]], prep_df[[2]]$medv)
  post_boot[[met]][[num]] <- postResample(predict_cv[[met]][[num]], prep_df[[2]]$medv)
}




