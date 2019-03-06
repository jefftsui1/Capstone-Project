library(caTools)

Daily <- read.csv("C:/Users/Jayden/Desktop/Springboard/machine learning/Complaints Daily.csv", header = T)[,-1]
Monthly <- read.csv("C:/Users/Jayden/Desktop/Springboard/machine learning/Complaints Monthly.csv", header = T)[,-1]

# Looking into the daily dataset
Daily
summary(Daily)
head(Daily)
plot(Daily)
plot(Daily$Average_Temperature, Daily$Number_of_Complaints, main = "Daily Number of Complaints vs. Average Temperature", xlab = "Average Temperature (°F)", ylab = "Number of Complaints")
abline(lm(Daily$Number_of_Complaints ~ Daily$Average_Temperature),col = "red")

# Splitting the data into training and test data
set.seed(314)
daily.split <- sample.split(Daily, SplitRatio = 0.7)
daily.split
daily.train <- subset(Daily, split = "TRUE")
daily.test <- subset(Daily, split = "FALSE")
daily.train
daily.test

# Creating the model
daily.model <- lm(Number_of_Complaints ~ Average_Temperature, data = daily.train)
summary(daily.model)

# Prediction
daily.pred <- predict(daily.model, daily.test)
daily.pred

# Comparing predicted vs actual values
plot(daily.test$Number_of_Complaints, type = "l", lty = 1.8, col = "blue")
lines(daily.pred, type = "l", col = "red")
plot(daily.pred, type = "l",lty = 1.8, col = "red")

Finding the accuracy
daily.rmse <- sqrt(mean(daily.pred - Daily$Number_of_Complaints)^2)
daily.rmse

# Looking into the monthly dataset
Monthly
summary(Monthly)
head(Monthly)
plot(Monthly)
plot(Monthly$Average_Temperature, Monthly$Number_of_Complaints, pch = 16, cex = 1.3, col = "blue", main = "Monthly Number of Complaints vs. Average Temperature", xlab = "Average Temperature (°F)", ylab = "Number of Complaints")
abline(lm(Monthly$Number_of_Complaints ~ Monthly$Average_Temperature),col = "red")

# Splitting the data into training and test data
set.seed(314)
monthly.split <- sample.split(Monthly, SplitRatio = 0.7)
monthly.split
monthly.train <- subset(Monthly, split = "TRUE")
monthly.test <- subset(Monthly, split = "FALSE")
monthly.train
monthly.test

# Creating the model
monthly.model <- lm(Number_of_Complaints ~ Average_Temperature, data = monthly.train)
summary(monthly.model)

# Prediction
monthly.pred <- predict(monthly.model, monthly.test)
monthly.pred

# Comparing predicted vs actual values
plot(monthly.test$Number_of_Complaints, type = "l", lty = 1.8, col = "blue")
lines(monthly.pred, type = "l", col = "red")
plot(monthly.pred, type = "l",lty = 1.8, col = "red")

Finding the accuracy
monthly.rmse <- sqrt(mean(monthly.pred - Monthly$Number_of_Complaints)^2)
monthly.rmse


