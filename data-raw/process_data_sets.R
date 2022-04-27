library(tidyverse)
library(devtools)
library(usethis)

#-------------------------------------------------------------------------------
# Datasets: Documented in R/datasets.R
#-------------------------------------------------------------------------------

# Blue Bikes Comprehensive Trip Histories 2020-2022

# 02/2022 data from "https://raw.githubusercontent.com/zyang2k/Blue-Bike-Trip-History-Data/master/202202-bluebikes-tripdata.csv"
trip_history_202202 <-
  "https://raw.githubusercontent.com/zyang2k/Blue-Bike-Trip-History-Data/master/202202-bluebikes-tripdata.csv" %>%
  read_csv()

# Run this to retrieve a sample of 1000 rows
set.seed(2022)
trip_history_sample <- trip_history_202202 %>%
  sample_n(1000) %>%
  mutate(
    usertype = as.factor(usertype),
    start_time = lubridate::ymd_hms(starttime),
    stop_time = lubridate::ymd_hms(stoptime)
  ) %>%
  select(-c(starttime, stoptime)) %>%
  rename(
    trip_duration = tripduration,
    bike_id = bikeid,
    user_type = usertype
  ) %>%
  clean_names()

use_data(trip_history_sample, overwrite = TRUE)

# Retrieve station data from https://s3.amazonaws.com/hubway-data/current_bluebikes_stations.csv
station_data <- read_csv("https://s3.amazonaws.com/hubway-data/current_bluebikes_stations.csv") %>%
  rename(
    number = `Last Updated`,
    name = `4/6/2022`,
    latitude = `...3`,
    longitude = `...4`,
    district = `...5`,
    public = `...6`,
    total_docks = `...7`,
    deployment_year = `...8`
  ) %>%
  filter(number != "Number") %>%
  mutate(
    latitude = as.numeric(latitude),
    longitude = as.numeric(longitude),
    total_docks = as.numeric(total_docks),
    deployment_year = as.numeric(deployment_year)
  )

use_data(station_data, overwrite = TRUE)
