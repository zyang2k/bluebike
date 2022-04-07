globalVariables(c(
  "usertype", "starttime", "stoptime", "tripduration", "bikeid"
))
#' Import monthly data from bluebike system data
#'
#' This function takes in numeric year/month values and imports data for the specified time
#'
#' @importFrom stringr str_c
#' @importFrom readr read_csv
#' @importFrom dplyr bind_rows
#' @importFrom utils unzip
#' @importFrom utils download.file
#' @importFrom magrittr "%>%"
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr rename
#' @return A spec_tbl_df object
#' @param year numeric value of year
#' @param month numeric value of month
#' @export import_month_data
#' @examples
#' \dontrun{
#' # Pull Jan., 2015 data from web
#' jan_2015 <- import_month_data(2015, 1)
#'
#' # Pull first quarter of 2015 data from web
#' spring2015 <- c(1, 2, 3)
#' quarter_1_2015 <- lapply(spring2015, import_month_data, year = 2015)
#' quarter_1_2015 <- bind_rows(quarter_1_2015)
#' }
import_month_data <- function(year, month){
  year <- as.character(year)
  if (month < 10) {
    month = str_c("0", as.character(month))}
  else {month = as.character(month)}

  if (! year %in% c("2015","2016","2017","2018","2019","2020","2021")) {
    stop("please enter year between 2015 - 2021")
  }
  if (! month %in% c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12")) {
    stop("please enter month between 1 - 12")
  }

  ym <- str_c(year, month) # create a 6 digit chr vector for reference

  download.file(
    url = str_c("https://s3.amazonaws.com/hubway-data/", ym, "-hubway-tripdata.zip"),
    destfile = str_c(tempdir(),"/", ym, "-hubway-tripdata.zip")
  )

  unzip(str_c(tempdir(), "/", ym, "-hubway-tripdata.zip"), exdir = tempdir())
  this_month_bike <- read_csv(str_c(tempdir(),"/", ym, "-hubway-tripdata.csv")) %>%
    mutate(
      usertype = as.factor(usertype),
      start_time = lubridate::ymd_hms(starttime),
      stop_time = lubridate::ymd_hms(stoptime)) %>%
    select(-c(starttime, stoptime)) %>%
    rename(trip_duration = tripduration,
           bike_id = bikeid,
           user_type = usertype) %>%
    janitor::clean_names()
}
