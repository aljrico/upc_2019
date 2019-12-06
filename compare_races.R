
library(tidyverse)
library(lubridate)
library(data.table)
library(harrypotter)
library(gameofthrones)

theme_set(theme_bw())

source("functions.R")
source("misc.R")
source("bootstrap_functions.R")

clean_data <- 
  fread("extra.csv") %>%
  complete_cleaning()

clean_data %>% 
  mutate(pure_breed = (Breed %in% c('DSH', 'DLH'))) %>% 
  filter(UPCR1 < 3) %>% 
  ggplot(aes(x = pure_breed, y = UPCR1, colour = pure_breed)) +
  geom_jitter() +
  geom_boxplot() +
  ggpubr::stat_compare_means() +
  scale_colour_hp_d(option = 'sprout', guide = FALSE) +
  xlab('Pure Breed') +
  ylab('UPC') +
  ggtitle('UPC levels by breed type')

clean_data %>% 
  mutate(pure_breed = (Breed %in% c('DSH', 'DLH'))) %>% 
  filter(UPCR1 < 3) %>% 
  ggplot(aes(x = UPCR1, colour = pure_breed, fill = pure_breed)) +
  geom_density(alpha = 0.7) +
  scale_fill_hp_d(option = 'sprout', name = 'Pure Breed') +
  scale_colour_hp_d(option = 'sprout', name = 'Pure Breed')

clean_data %>% 
  mutate(pure_breed = (Breed %in% c('DSH', 'DLH'))) %>% 
  ggpubr::compare_means(data = ., formul = UPCR1 ~ pure_breed)



x <- rnorm(mean = 5, n = 1e3)
y <- runif(1e3)
df <- tibble(x, y)
df %>% 
  melt() %>% 
  ggplot(aes(variable, value)) +
  geom_jitter() +
  # geom_boxplot() +
  ggpubr::stat_compare_means()

