#' Random 1000 samples from the Blue Bikes System Data website.
#'
#' a random sample from all monthly trip history data from 2020 to 2022
#' retrieved from bluebikes system data
#'
#' @format A data frame of 1,000 rows representing each sample of trip history
#' \describe{
#'   \item{tripduration}{Trip duration of each trip measured in seconds}
#'   \item{starttime}{Start time and date of each trip}
#'   \item{stoptime}{Stop time and date of each trip}
#'   \item{start station id}{The identification variable of the start station}
#'   \item{start station name}{The name of the end station}
#'   \item{start station latitude}{The latitude of the start station}
#'   \item{start station longitude}{The longitude of the start station}
#'   \item{end station id}{The identification variable of the end station}
#'   \item{end station name}{The name of the end station}
#'   \item{end station latitude}{The latitude of the end station}
#'   \item{end station longitude}{The longitude of the start station}
#'   \item{bikeid}{The identification variable of the bike corresponding to each trip}
#'   \item{usertype}{Type of user in each trip (Casual = Single Trip or Day Pass user; Member = Annual or Monthly Member)}
#'   \item{birth year}{The birth year of the user}
#'   \item{gender}{The self-reported gender of the user}
#'   \item{postal code}{Postal code of the user}
#' }
#' @source The original source of the data are bluebikes system data retrieved from <https://www.bluebikes.com/system-data>
"trip_history_sample"
