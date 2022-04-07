#' bluebike - A Data Package for Bluebike users
#'
#' The bluebike package provides the sampled dataset from Bluebike System Data
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
