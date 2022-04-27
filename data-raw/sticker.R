library(hexSticker)
library(ggplot2)

logo <- "./data-raw/bike_angel.png"

bluebike_sticker <- sticker(logo,
  package = "bluebike",
  p_size = 20, p_y = 1.5,
  s_x = 1, s_y = .85, s_width = .6,
  filename = here::here("data-raw", "hex_bluebike.png"),
  p_color = "white",
  h_fill = "#2351a6", h_size = 1.5,
  h_color = "#5488E7"
)

save_sticker(
  here::here("data-raw", "hex_bluebike.png"),
  bluebike_sticker
)
