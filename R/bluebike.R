#' bluebike - A Data Package for Bluebike users
#'
#' @docType package
#' @name bluebike
#'
#' @description
#' `bluebike` includes functions and dataset that aids bluebike users to retrieve data and perform data wrangling and visualizations
#'
#' @details
#' This package includes data from the Boston Blue Bike trip history data acquired from the [Blue Bikes System Data](https://www.bluebikes.com/system-data). The users can import all monthly trip history data from 2020 to 2022 into a cleaned data set that can easily be used for data analysis.
#' The package also includes a sample data set that includes 1000 sampled trip history from Feb. 2022, and a full data set that contains information about all available stations.
#' The package also serves as a visualization tool for user to browse for closest stations as well as trip-planning via computing trip distances. \cr
#'
#' Available functions are: \cr
#' \itemize{
#'  \item{`import_month_data`}\cr {Takes in numeric year/month values and imports data from [Blue Bikes System Data](https://www.bluebikes.com/system-data) for the specified time}
#'  \item{`station_distance`}\cr {Returns stations with distance in ascending order given the user's current location}
#'  \item{`station_radius`}\cr {Plots the position of the stations within walking distance (500 m), and present the basic information about the stations via leaflet}
#'  \item{`trip_distance`}\cr {Computes the geographical distance between the start and end stations}
#' }
#'
#' Available datasets are: \cr
#' \itemize{
#'  \item{`trip_history_sample`} \cr {A sample of 1000 trip data entries from February 2022}
#'  \item{`station_data`} \cr {A dataset that includes identification, position, and other basic information about bluebike stations}
#' }
#'
#' @examples
#' # Find most used stations:
#' stations <- trip_history_sample %>%
#'     group_by(`start_station_name`) %>%
#'     summarize(trips_from = n())
#' head(stations)
#'
NULL
