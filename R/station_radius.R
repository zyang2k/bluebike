
#' Plot bike stations within a given radius
#'

station_radius <- function(long, lat, r){
  station_distances <- station_distance(long,lat) %>%
    filter(distance < r)
  station_map <- leaflet(data = station_distances) %>%
    addTiles() %>%
    addCircleMarkers(lng = station_distances$long,
                     lat = station_distances$,
                     radius = ,
                     color = "blue")

}
