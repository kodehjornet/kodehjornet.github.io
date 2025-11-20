library(tidyverse)
weight <- c(50, 60, 70, 80, 90, 50, 60, 75)
height <- c(160, 165, 170, 175, 180, 165, 168, 175)

df <- data.frame(height, weight)

model1 <- lm(height ~ weight, data = df)
summary(model1)

df %>% 
  ggplot(aes(height, weight)) +
  geom_point() +
  geom_smooth(method = "lm")
