

library(titanic)
head(titanic_train)

# Drop NA 
titanic_train <- na.omit(titanic_train)

# Split data
set.seed(42)
n <- nrow(titanic_train)
id <- sample(1:n, size = n*0.7)
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]

# Train Model
train_model <- glm(train_data$Survived ~ train_data$Pclass, data = train_data, family = "binomial")
# Test Model
test_model <- glm(test_data$Survived ~ test_data$Pclass, data = test_data, family = "binomial")


# Predict and Evaluate Train Model
train_data$prob_survive <- predict(train_model, type = "response")
train_data$pred_survive <- ifelse(train_data$prob_survive>=0.5, 1, 0)
# Predict and Evaluate Test Model
test_data$prob_survive <- predict(test_model, type = "response")
test_data$pred_survive <- ifelse(test_data$prob_survive>=0.5, 1, 0)

# Confusion matrix Train Model
conM_train <- table(train_data$pred_survive, train_data$Survived, dnn=c("Predicted", "Actual"))
# Confusion matrix Test Model
conM_test <- table(test_data$pred_survive, test_data$Survived, dnn=c("Predicted", "Actual"))

# Model Evaluation
# Train Model
accuracy_train <- (conM_train[1,1]+ conM_train[2,2])/sum(conM_train)
precision_train <- conM_train[2,2]/(conM_train[2,1]+ conM_train[2,2])
recall_train <- conM_train[2,2]/(conM_train[1,2]+ conM_train[2,2])
f1_train <- 2*(precision_train*recall_train)/(precision_train+recall_train)

# Test Model
accuracy_test <- (conM_test[1,1]+ conM_test[2,2])/sum(conM_test)
precision_test <- conM_test[2,2]/(conM_test[2,1]+ conM_test[2,2])
recall_test <- conM_test[2,2]/(conM_test[1,2]+ conM_test[2,2])
f1_test <- 2*(precision_test*recall_test)/(precision_test+recall_test)



