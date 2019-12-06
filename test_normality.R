
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
  ggplot(aes(x = UPCR1)) +
  geom_histogram(colour = 'black') +
  theme_bw() +
  ggtitle('UPC Distribution') +
  xlab('UPC') +
  ylab('')


ks.test(rnorm(1e2), clean_data$UPCR1)
ggpubr::ggqqplot(clean_data$UPCR1) + 
  ggtitle('QQ-Plot testing UPC distribution normality') +
  theme_bw()

shapiro.test(clean_data$UPCR1)
