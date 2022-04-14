globalVariables(c(
  "station_data"
))
#' Compute the closet station given current location
#'
#' This function returns stations within walking distance given the user's current location
#'
#' @importFrom dplyr mutate
#' @importFrom sf st_as_sf
#' @importFrom sf st_distance
#' @importFrom tidyselect starts_with
#' @importFrom magrittr "%>%"
#' @importFrom utils "head"
#' @return a tbl_df object showing the distance between the user and top five closest stations with ID, name, number of docks, and position
#' @param long longtitude of user location
#' @param lat latitude of user location
#' @export closest_station
#' @examples
#' # Calculate distance for user at (-71.11467361, 42.34414899)
#' top_5_station <- closest_station(-71.11467361, 42.34414899)
closest_station <- function(long, lat){
  station_sf <- st_as_sf(station_data, coords = c("longitude", "latitude"),
                                       crs = 4326)

  user_sf <- c("longitude" = long, "latitude" = lat) %>%
    `t` %>%
    as.data.frame() %>%
    st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

  station_distance <- st_distance(x = station_sf, y = user_sf) %>%
    as.data.frame() %>%
    mutate(station_ID= station_data$number,
           station_name = station_data$name,
           station_position = station_sf$geometry,
           docks = station_data$total_docks) %>%
    rename(distance = '.')

  station_distance <- station_distance[order(station_distance$distance),]
  return(head(station_distance, 5))
}
