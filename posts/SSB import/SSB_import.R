library(PxWebApiData)
library(ggplot2)
library(tidyverse)

variables <- ApiData("https://data.ssb.no/api/v0/no/table/09443",
                     returnMetaFrames = TRUE)

names(variables)


values <- ApiData("https://data.ssb.no/api/v0/no/table/09443",
                     returnMetaFrames = TRUE)

values[[1]]$values # Region

values[[2]]$values # Politisk parti

values[[3]]$values # Kjønn

values[[4]]$values # Kandidater

values[[5]]$values # Tid

my_data <- ApiData("https://data.ssb.no/api/v0/no/table/09443",
                Tid = c("2005", "2021"),
                Region = "0", 
                PolitParti = c("Alle partier"),
                Kjonn = c("1", "2")
                )

my_data <- my_data[[1]] # Removes the description of what the data is - makes it into a  workable data frame.

head(my_data) # Shows the data set (head shows only a few - but this only contains four observations.)

comment(my_data) # See additional information about the data:
# Label, source and last update.

my_data %>% 
  ggplot(aes(x = fireårlig,
             y = value,
             fill = kjønn)) +
  labs(title = "Distribution of women and men as list candidates in political parties in Norway
       In 2005 and 2021.",
       x = "Year",
       y = "Candidates in political parties",
       fill = "Gender",
       caption = "List candidates to Parlamentary elections in Norway by gender.
       Source: Statistisk Sentralbyrå
       Last updated: 28/06/2021") +
  theme_bw() +
  geom_bar(stat = "identity",
           position = "dodge") +
  scale_fill_grey()
  
