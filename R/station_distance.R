globalVariables(c(
  "station_data"
))
#' Compute the distance from stations given current location
#'
#' This function returns stations with distance in ascending order given the user's current location
#'
#' @importFrom dplyr mutate
#' @importFrom sf st_as_sf
#' @importFrom sf st_distance
#' @importFrom tidyselect starts_with
#' @importFrom magrittr "%>%"
#' @return a tbl_df object showing the distance between the user and top five closest stations with ID, name, number of docks, and position
#' @param long longtitude of user location
#' @param lat latitude of user location
#' @export station_distance
#' @examples
#' # Calculate distance for user at (-71.11467361, 42.34414899) and show the closest five stations
#' top_5_station <- head(station_distance(-71.11467361, 42.34414899),5)
station_distance <- function(long, lat){
  station_sf <- st_as_sf(station_data, coords = c("longitude", "latitude"),
                                       crs = 4326)

  user_sf <- c("longitude" = long, "latitude" = lat) %>%
    `t` %>%
    as.data.frame() %>%
    st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

  temp <- st_distance(x = station_sf, y = user_sf) %>%
    as.data.frame() %>%
    mutate(station_ID= station_data$number,
           station_name = station_data$name,
           station_position = station_sf$geometry,
           docks = station_data$total_docks) %>%
    rename(distance = '.')

  ordered_station <- temp[order(temp$distance),]
  return(ordered_station)
}


