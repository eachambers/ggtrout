
# Code to create ggtrout data ---------------------------------------------


# Raster data -------------------------------------------------------------

# Chicago Basin
chibasin_coords <- data.frame(x = c("-107.741422", "-107.570941", "-107.741422", "-107.570941"),
                              y = c("37.718246", "37.718246", "37.582138", "37.582138"))

chibasin <- elevatr::get_elev_raster(chibasin_coords, prj = "WGS84", z = 10)
chibasin <- raster::as.data.frame(chibasin, xy = TRUE) %>%
  dplyr::rename(elevation = file108b62915aa12) %>%
  dplyr::filter(x >= -107.8 & x <= -107.6)
usethis::use_data(chibasin, overwrite = TRUE)

# Blue Lakes
bluelakes_coords <- data.frame(x = c("-107.839941", "-107.839941", "-107.781356", "-107.781356"),
                              y = c("38.020034", "37.984953", "37.984953", "38.020034"))

bluelakes <- elevatr::get_elev_raster(bluelakes_coords, prj = "WGS84", z = 14)
bluelakes <- raster::as.data.frame(bluelakes, xy = TRUE) %>%
  dplyr::rename(elevation = file108b63ce85cd7)
usethis::use_data(bluelakes, overwrite = TRUE)


# animas ------------------------------------------------------------------

# Use USGS tool to retrieve water temp data for Animas River (Durango CO)
animas <- dataRetrieval::readNWISdv(
  siteNumber = "09361500", parameterCd = "00010",
  startDate = "2016-01-01", endDate = "2023-11-07")

# Clean up dataset
animas <- animas %>%
  dplyr::rename(water_temp = X_00010_00003) %>%
  tidyr::separate_wider_delim(cols = Date, delim = "-", names = c("year", "month", "day")) %>%
  unite(col = "date", c("month", "day"), sep = "-")

# Export
usethis::use_data(animas, overwrite = TRUE)
