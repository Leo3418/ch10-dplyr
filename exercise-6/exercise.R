# Exercise 6: dplyr join operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
dest_delays <- flights %>%
  group_by(dest) %>%
  summarize(avg_arr_delays = mean(arr_delay, na.rm = TRUE)) %>%
  select(dest, avg_arr_delays)
airport_info <- left_join(airports, dest_delays, by = c("faa" = "dest"))

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
airline_delays <- flights %>%
  group_by(carrier) %>%
  summarize(avg_arr_delays = mean(arr_delay, na.rm = TRUE)) %>%
  select(carrier, avg_arr_delays) %>%
  arrange(avg_arr_delays) %>%
  head(n = 1L)
