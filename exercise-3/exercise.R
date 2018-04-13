# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library(dplyr)

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
acuras <- filter(vehicles, make == "Acura")
acuras_2015 <- filter(acuras, year == 2015)
best_hwy_mgh <- filter(acuras_2015, hwy == max(acuras_2015$hwy))
select(best_hwy_mgh, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
select(
  filter(
    filter(
      filter(vehicles, make == "Acura"), year == 2015
    ),
    hwy == max(acuras_2015$hwy)
  ),
  model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
filter(vehicles, make == "Acura") %>%
  filter(year == 2015) %>%
  filter(hwy == max(hwy)) %>%
  select(model)

### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
