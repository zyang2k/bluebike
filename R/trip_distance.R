globalVariables(c(
  "trip_history_sample", "start_station_sf", "end_station_sf", "end_station_sf"
))
#' Compute trip distance for a specific dataset
#'
#' This function computes the geographical distance between the start and end stations for trips in a given dataset
#'
#' @importFrom dplyr mutate
#' @importFrom sf st_as_sf
#' @importFrom sf st_distance
#' @importFrom tidyselect starts_with
#' @importFrom magrittr "%>%"
#' @return a tbl_df object with an additional distance column
#' @param data trip data pulled from the Blue Bike System data
#' @export trip_distance
#' @examples
#' # Calculate distance for sample trip data
#' sample_distance <- trip_distance(trip_history_sample)$distance
trip_distance <- function(data) {
  if (length(intersect(class(data), c("tbl_df", "tbl", "data.frame"))) == 0) {
    stop("Input should be a tbl_df, tbl, or data.frame object.")
  }
  if (length(intersect(c("start_station_longitude", "start_station_latitude", "end_station_longitude", "end_station_latitude"), colnames(data))) != 4) {
    stop("Invalid data. Need longitude and latitude of start and end stations to compute distance.")
  }
  data_sf <- data %>%
    mutate(
      start_station_sf = st_as_sf(trip_history_sample,
        coords = c("start_station_longitude", "start_station_latitude"),
        crs = 4326, agr = "constant"
      ),
      end_station_sf = st_as_sf(trip_history_sample,
        coords = c("end_station_longitude", "end_station_latitude"),
        crs = 4326, agr = "constant"
      )
    ) %>%
    mutate(distance = st_distance(start_station_sf, end_station_sf)) %>%
    select(!starts_with("start_station_sf") & !starts_with("end_station_sf"))
}
