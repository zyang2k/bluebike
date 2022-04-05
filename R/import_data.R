#' @importFrom stringr str_c
#' @importFrom readr read_csv
#' @importFrom dplyr bind_rows
#'
#' @param year
#' @param month
#' @param years
#' @param allym
#' @param ym


#' combine year month

years <- c("2015", "2016", "2017","2018","2019","2020","2021")
months <- c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12")
combine_year_month <- function(year, month){
  ym <- str_c(year, month)
}
allym <- sapply(years, combine_year_month, months)

#' import_bike_data

import_bike_data <- function(ym){
  download.file(
    url = str_c("https://s3.amazonaws.com/hubway-data/", ym, "-hubway-tripdata.zip"),
    destfile = str_c("data-raw/", ym, "-hubway-tripdata.zip")
  )
  unzip(str_c("data-raw/", ym, "-hubway-tripdata.zip"), exdir = "data")
  this_yr_bike <- read_csv(str_c("data/", ym,"-hubway-tripdata.csv"))
}
bike_data <- lapply(allym, import_bike_data)
bike_data[[24]][["birth year"]] <- as.character(bike_data[[24]][["birth year"]])
bike <- bind_rows(bike_data)
