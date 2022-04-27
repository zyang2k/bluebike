globalVariables(c(
  "distance"
))
#' Plot bike stations within a given radius
#'
#' This function plots the position of the stations within walking distance
#'
#' @importFrom dplyr filter
#' @importFrom dplyr left_join
#' @import leaflet
#' @importFrom magrittr "%>%"
#' @return A leaflet map
#' @param long numeric value of longitude
#' @param lat numeric value of latitude
#' @param r numeric value of set radius in meters
#' @export station_radius
#' @examples
#' \dontrun{
#' # Show user at (-71.11467, 42.34415) and set the radius to 500 m
#' station_radius(long = -71.11467, lat = 42.34415, r = 2000)
#' }

station_radius <- function(long, lat, r = 1000){
  long <- as.numeric(long)
  lat <- as.numeric(lat)

  if (long < -180 | long > 180) {
    stop("please enter a valid longitude between -180 and 180")
  }
  if (lat < -90 | lat > 90) {
    stop("please enter a valid latitude between -90 and 90")
  }

  station_distances <- station_distance(long, lat) %>%
    filter(as.numeric(distance) < r) %>%
    left_join(station_data, by = c("station_ID" = "number"))

  user_position_icon <- awesomeIcons(
    icon = "user position",
    iconColor = "pink"
  )
  station_map <- leaflet(data = station_distances) %>%
    addTiles() %>%
    addMarkers(station_distances$longitude, station_distances$latitude,
              popup = paste0("Station: ", station_distances$name, "<br>",
                             "# docks: ", station_distances$total_docks),
              options = popupOptions(closeButton = TRUE)) %>%
    addCircles(long, lat,
               radius = r) %>%
    addAwesomeMarkers(long, lat, icon = user_position_icon, label = "you are here!")

  return(station_map)
}
