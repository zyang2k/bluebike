#' Random 1000 samples from the Blue Bikes System Data website
#'
#' a random sample of bluebike trip history data from February, 2022
#'
#' @format A data frame of 1,000 rows representing each sample of trip history
#' \describe{
#'   \item{trip_duration}{Trip duration of each trip measured in seconds}
#'   \item{start_time}{Start time and date of each trip}
#'   \item{stop_time}{Stop time and date of each trip}
#'   \item{start_station_id}{The identification variable of the start station}
#'   \item{start_station_name}{The name of the end station}
#'   \item{start_station_latitude}{The latitude of the start station}
#'   \item{start_station_longitude}{The longitude of the start station}
#'   \item{end_station_id}{The identification variable of the end station}
#'   \item{end_station_name}{The name of the end station}
#'   \item{end_station_latitude}{The latitude of the end station}
#'   \item{end_station_longitude}{The longitude of the start station}
#'   \item{bike_id}{The identification variable of the bike corresponding to each trip}
#'   \item{user_type}{Type of user in each trip (Casual = Single Trip or Day Pass user; Member = Annual or Monthly Member)}
#'   \item{postal_code}{Postal code of the user}
#' }
#' @source The original source of the data are bluebikes system data retrieved from <https://www.bluebikes.com/system-data>
"trip_history_sample"
