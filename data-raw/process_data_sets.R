library(tidyverse)
library(devtools)
library(usethis)

#-------------------------------------------------------------------------------
# Datasets: Documented in R/datasets.R
#-------------------------------------------------------------------------------

# Blue Bikes Comprehensive Trip Histories 2020-2022

# Do not try to run this block unless necessary!
trip_history <- list.files("data-raw", pattern = "*.csv", full.names = TRUE)%>%
  map_df(~read_csv(file = .x))
usethis::use_data(trip_history, overwrite = TRUE)

# Run this
set.seed(2022)
trip_history_sample <- trip_history %>%
  sample_n(1000)
usethis::use_data(trip_history_sample, overwrite = TRUE)

