

# load libraries
library(tidyverse)
library(lubridate)
library(hockeystick)

# load global temperature data (anomalies)
glob_temps <- get_temp() %>%
  mutate(YEAR = year(Year),
         MEAN_GLOB_C = `J-D` + 14,
         MEAN_GLOB_F = (MEAN_GLOB_C*9/5) + 32) %>%
  select(YEAR, MEAN_GLOB_C, MEAN_GLOB_F)

write_delim(glob_temps, "data/globalTemps.txt", delim = "\t")

ggplot(glob_temps, aes(x = YEAR, y = MEAN_GLOB_C)) +
  geom_line() +
  scale_y_continuous(limits = c(0, 35)) +
  labs(x = "year", y = "Temp [C]",
       title = "Global Temperature",
       subtitle = "Data: NASA/GISS",
       caption = "Data source") +
  theme_classic()
