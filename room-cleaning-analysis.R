library(data.table)
library(tidyverse)
library(ggplot2)

data <- read.csv( file = './data/room-cleaning-times.csv', stringsAsFactors=FALSE )

data <- data %>%
  mutate( Date = as.Date(Date),
          Time = as.numeric(as.ITime(Time))/60/60 )

data %>%
  ggplot( aes(x=Date, y=Time) ) +
  geom_smooth(method='loess') +
  geom_line() +
  geom_point() +
  # scale_y_continuous( limits=c(0,10) ) +
  ylab('Time to tidy room (mins)') +
  xlab('Date') +
  theme_classic()
