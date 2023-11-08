
#' Load example datasets
#'
#' @param quiet whether to load without messages
#'
#' @return loads chibasin, bluelakes, and animas objects
#' @export
load_trout_example <- function(quiet = FALSE) {
  # Load all data
  utils::data(list = c("chibasin", "bluelakes", "animas"))

  if (!quiet) {
    # Give info about objects
    return(message(cat(
      crayon::cyan(crayon::bold("\n---------------- Example data ----------------\n")),
      crayon::cyan("\nObjects loaded:"),
      crayon::green(crayon::bold("\n*chibasin*")),
      crayon::green(paste0("elevation data for the Chicago Basin, CO")),
      crayon::blue(crayon::bold("\n*bluelakes*")),
      crayon::blue("elevation data for Blue Lakes, CO"),
      crayon::magenta(crayon::bold("\n*animas*")),
      crayon::magenta("Daily water temperature for the Animas River from 2016-2023"),
      crayon::cyan(crayon::bold("\n\n-------------------------------------------------\n"))
    )))
  }
}
