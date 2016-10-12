library(dplyr)
library(ggplot2)

source("external/dataManipulation.R", encoding = "UTF-8")

Gtableflat %>%
  group_by(city, age_by10) %>%
  summarise (n = sum(Freq)) %>%
  mutate(freq_city = n / sum(n)) %>%
  ggplot(aes(x=age_by10, y=freq_city)) +
  geom_histogram(stat="identity") +
  # facet_grid(city ~.) +
  facet_wrap(~city )
