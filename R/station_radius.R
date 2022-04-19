
#' Plot bike stations within a given radius
#'

station_radius <- function(long, lat, r){
  station_distances <- station_distance(long,lat) %>%
    filter(as.numeric(distance) < r) %>%
    left_join(station_data, by = c("station_ID" = "number"))

  station_map <- leaflet(data = station_distances) %>%
    addTiles() %>%
    addPopups(station_distances$longitude, station_distances$latitude,
              popup = paste0("Station: ", station_distances$name, "<br>",
                             "# docks: ", station_distances$total_docks),
              options = popupOptions(closeButton = TRUE)) %>%
    addCircles(station_distances$longitude, station_distances$latitude,
               radius = r)
}
