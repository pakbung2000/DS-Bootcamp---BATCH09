

library(tidyverse)
library(caret)
library(mlbench)
library(ggpubr)

# View correlation

df <- read.csv("churn.csv")

corMat <-  df %>%
  select(accountlength, numbervmailmessages, totaldayminutes,
         totaldaycalls, totaldaycharge, totaleveminutes,
         totalevecalls, totalevecharge, totalnightminutes,
         totalnightcalls, totalnightcharge, totalintlminutes,
         totalintlcalls, totalintlcharge, numbercustomerservicecalls) %>%
  cor()

corMat

# churn_aggregate.R file

# 1. Split

train_test_split <- function(data, size){
  set.seed(42)
  n <- nrow(data)
  train_id <- sample(1:n, size = n*size)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return(list(train_df, test_df))
}

prep_df <- train_test_split(df, 0.8)

# 2. Trian

# Accuracy Metric
# KNN-CV

train_control = c()
acc_preCenter = c()
acc_preRange = c()

for (num in c(5,10)){
  train_control[[num]] <- trainControl(method = "cv",
                                       number = num,
                                       verboseIter = TRUE) # progress bar
  
}


for(num in c(5,10)){
  acc_preCenter[[num]] <- train(churn ~ internationalplan +
                                        totaldayminutes+ totaldaycharge +
                                        totalintlminutes + totalintlcharge +
                                        numbercustomerservicecalls,
                                        data = prep_df[[1]],
                                        method = "knn",
                                        metric = "Accuracy",
                                        tuneLength = 5,
                                        trControl = train_control[[num]],
                                        preProcess = c("center", "scale"))
}





for(num in c(5,10)){
  acc_preRange[[num]] <- train(churn ~ internationalplan +
                                       totaldayminutes+ totaldaycharge +
                                       totalintlminutes + totalintlcharge +
                                       numbercustomerservicecalls,
                                       data = prep_df[[1]],
                                       method = "knn",
                                       metric = "Accuracy",
                                       tuneLength = 5,
                                       trControl = train_control[[num]],
                                       preProcess = "range")
}


# Precision Recall

pr_preCenter = c()
pr_preRange = c()

for (num in c(5,10)){
  train_control[[num]] <- trainControl(method = "cv",
                                       number = num,
                                       summaryFunction = prSummary,
                                       classProbs = TRUE,
                                       verboseIter = TRUE) # progress bar
  
}


for(num in c(5,10)){
  pr_preCenter[[num]] <- train(churn ~ internationalplan +
                                  totaldayminutes+ totaldaycharge +
                                  totalintlminutes + totalintlcharge +
                                  numbercustomerservicecalls,
                                data = prep_df[[1]],
                                method = "knn",
                                metric = "AUC",
                                tuneLength = 5,
                                trControl = train_control[[num]],
                                preProcess = c("center", "scale"))
}





for(num in c(5,10)){
  pr_preRange[[num]] <- train(churn ~ internationalplan +
                                 totaldayminutes+ totaldaycharge +
                                 totalintlminutes + totalintlcharge +
                                 numbercustomerservicecalls,
                               data = prep_df[[1]],
                               method = "knn",
                               metric = "AUC",
                               tuneLength = 5,
                               trControl = train_control[[num]],
                               preProcess = "range")
}


# Decision tree (Recursive Partitioning)


rpart_preRange = c()
rpart_preCen = c()

for(num in c(5,10)){
  rpart_preCen[[num]] <- train(churn ~ internationalplan +
                                 totaldayminutes+ totaldaycharge +
                                 totalintlminutes + totalintlcharge +
                                 numbercustomerservicecalls,
                               data = prep_df[[1]],
                               method = "rpart",
                               metric = "ROC",
                               tuneLength = 5,
                               trControl = train_control[[num]],
                               preProcess = c("center", "scale"))
}





for(num in c(5,10)){
  rpart_preRange[[num]] <- train(churn ~ internationalplan +
                                totaldayminutes+ totaldaycharge +
                                totalintlminutes + totalintlcharge +
                                numbercustomerservicecalls,
                              data = prep_df[[1]],
                              method = "rpart",
                              metric = "ROC",
                              tuneLength = 5,
                              trControl = train_control[[num]],
                              preProcess = "range")
}





# 3. Score

pred_acc_preCen = c()
pred_acc_preRange = c()

for(num in c(5,10)){
  pred_acc_preCen[[num]] <- predict(acc_preCenter[[num]], newdata = prep_df[[2]])
}

for(num in c(5,10)){
  pred_acc_preRange[[num]] <- predict(acc_preRange[[num]], newdata = prep_df[[2]])
}


pred_pr_preCen = c()
pred_pr_preRange = c()

for(num in c(5,10)){
  pred_pr_preCen[[num]] <- predict(pr_preCenter[[num]], newdata = prep_df[[2]])
}

for(num in c(5,10)){
  pred_pr_preRange[[num]] <- predict(pr_preRange[[num]], newdata = prep_df[[2]])
}


pred_rpart_preCen = c()
pred_rpart_preRange = c()

for(num in c(5,10)){
  pred_rpart_preCen[[num]] <- predict(rpart_preCen[[num]], newdata = prep_df[[2]])
}

for(num in c(5,10)){
  pred_rpart_preRange[[num]] <- predict(rpart_preRange[[num]], newdata = prep_df[[2]])
}



# 4. Evaluate
# Accuracy
confusionMatrix(factor(pred_acc_preCen[[5]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")

confusionMatrix(factor(pred_acc_preCen[[10]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")

confusionMatrix(factor(pred_acc_preRange[[5]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")

confusionMatrix(factor(pred_acc_preRange[[10]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")

# AUC

confusionMatrix(factor(pred_pr_preCen[[5]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")

confusionMatrix(factor(pred_pr_preCen[[10]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")


confusionMatrix(factor(pred_pr_preRange[[5]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")

confusionMatrix(factor(pred_pr_preRange[[10]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes",
                mode = "prec_recall")


# Decision tree

confusionMatrix(factor(pred_rpart_preCen[[5]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes")

confusionMatrix(factor(pred_rpart_preCen[[10]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes")

confusionMatrix(factor(pred_rpart_preRange[[5]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes")

confusionMatrix(factor(pred_rpart_preRange[[10]]), 
                factor(prep_df[[2]]$churn),
                positive = "Yes")


