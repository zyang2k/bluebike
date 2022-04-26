
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bluebike R package

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
![build: passing](https://img.shields.io/badge/build-passing-green)
![version](https://img.shields.io/badge/version-0.0.0.9001-blue)
<!-- badges: end -->

The `bluebike` R package contains data from [Blue Bikes System
Data](https://www.bluebikes.com/system-data) website. It contains
monthly trip data from Feb. 2022.

The data includes:

-   The name and geographic location of the bike stations
-   Start and end time of the trip
-   Trip duration
-   Bike id
-   Basic user information

Additionally, the data includes a random sample of 1000 trip history
entries for sample analysis and functions for importation of the full
data set.

## Installation

You can install the development version of bluebike from
[GitHub](https://github.com/zyang2k/bluebike) with:

``` r
# install.packages("devtools")
devtools::install_github("zyang2k/bluebike")
```

## Sample Data Set

-   `trip_history_sample`: a sample of 1000 trip data entries from
    February 2022.

## Basic Usage

### Data Wrangling

Count the number of trips from starting stations:

``` r
library(bluebike)
library(dplyr)

stations <- trip_history_sample %>% 
  group_by(start_station_name) %>% 
  summarize(trips_from = n())
head(stations)
#> # A tibble: 6 × 2
#>   start_station_name                        trips_from
#>   <chr>                                          <int>
#> 1 175 N Harvard St                                   8
#> 2 191 Beacon St                                      3
#> 3 30 Dane St                                         7
#> 4 359 Broadway - Broadway at Fayette Street          4
#> 5 606 American Legion Hwy at Canterbury St           1
#> 6 699 Mt Auburn St                                   5
```

### Data Visualization via Leaflet

Display the position of the starting stations:

![a visualization demo](data-raw/viz_demo.png)

``` r
library(leaflet)

BostonMap <- leaflet(data = trip_history_sample) %>% 
  addTiles() %>% 
  addCircleMarkers(lng = trip_history_sample$start_station_longitude, 
                   lat = trip_history_sample$start_station_latitude, 
                   radius = 0.1, 
                   color = "blue")

BostonMap
```

## Contributors

-   [Ziyue Yang](https://github.com/zyang2k)
-   [Tianshu Zhang](https://github.com/tianshu-zhang)
