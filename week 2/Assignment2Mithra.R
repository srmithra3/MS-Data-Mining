usedcars_noisy <- read.csv("usedcars_noisy.csv") 
str(usedcars_noisy) 
head(usedcars_noisy)
usedcars_noisy 
mean_val <- mean (usedcars_noisy$price, 0, FALSE)
mean_val
usedcars_noisy$price <- replace (usedcars_noisy$price, usedcars_noisy$price <= 0, mean_val)
median_val <- median(usedcars_noisy$mileage, FALSE)
median_val
usedcars_noisy$mileage <- replace (usedcars_noisy$mileage, usedcars_noisy$mileage <= -1, median_val)
usedcars_noisy$price
usedcars_noisy$mileage
df <- data.frame(usedcars_noisy)
write.csv(df,file= "usedcars_clean.csv")