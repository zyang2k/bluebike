#' bluebike - A Data Package for Bluebike users
#'
#' This package includes data from the Boston Blue Bike trip history data acquired from the [Blue Bikes System Data](https://www.bluebikes.com/system-data). The users can import all monthly trip history data from 2020 to 2022 into a cleaned data set that can easily be used for data analysis.
#' The package also includes a sample data set that includes 1000 sampled trip history from Feb. 2022, and a full data set that contains information about all available stations.
#' The package also serves as a visualization tool for user to browse for closest stations as well as trip-planning via computing trip distances.
#'
#' @docType package
#' @name bluebike
#' @examples
#' \dontrun{
#' # Find most used stations:
#' stations <- trip_history_sample %>%
#'     group_by(`start_station_name`) %>%
#'     summarize(trips_from = n())
#' head(stations)
#' }
NULL
