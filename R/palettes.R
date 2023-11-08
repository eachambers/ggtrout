#' Complete list of palettes
#'
#' Use \code{\link{ggtrout_palette}} to construct palettes of desired length.
#'
#' @export
ggtrout_palettes <- list(
  brook1 = list(c("#df3d3a", "#d9bb01", "#e0902e", "#92a1c6", "#757877", "#563c2a", "#babfb4"), type = "qualitative"),
  brook2 = list(c("#ac7d0d", "#bd9500", "#d9bb01", "#e8ce63", "#edd68b"), type = "monochromatic"),
  brook3 = list(c("#ac7d0d", "#bd9500", "#d9bb01", "#e8ce63", "#ffd1b3", "#f3a567", "#e68114", "#eb6036", "#df3d3a"), type = "diverging"),
  cutthroat1 = list(c("#e8d089", "#eeb054", "#715852", "#ea5c2e", "#cb7086", "#886c54", "#969cad"),  type = "qualitative"),
  cutthroat2 = list(c("#81654d", "#a6885b", "#e8ab51", "#f2b851", "#f4c444", "#e8d089"), type = "monochromatic"),
  cutthroat3 = list(c("#e8ab51", "#f2b851", "#f4c444", "#e8d089", "#dab78d", "#c3a491", "#9f8878", "#a47e74", "#715852"), type = "diverging"),
  rainbow1 = list(c("#799dc7", "#bbb0e7", "#897dca", "#b0ccea", "#727c8a", "#cdd3d6", "#baa5a7", "#847d6d"), type = "qualitative"),
  rainbow2 = list(c("#727c8a", "#7d899b", "#b5bec8", "#cdd3d6", "#dbe2de", "#b0ccea", "#93abd8", "#9ba0d2", "#7884c4"), type = "diverging"),
  rainbow3 = list(c("#5f6853", "#abb285", "#ccb3d7", "#88a1c6", "#f39e87", "#9d9995", "#906530", "#ad4738"), type = "qualitative"),
  greenback = list(c("#3e474a", "#626d5d", "#877956", "#d5ca99", "#b8ae8b", "#aa928d", "#b08848", "#b65f31"), type = "qualitative")
)

#' Generates ggtrout palette
#'
#' This function is largely adapted from the `wes_palette()` function in the [wesanderson](https://github.com/karthik/wesanderson/tree/master) package.
#'
#' @param name name of palette. Options are: `"brook1"`, `"brook2"`, `"brook3"`, `"cutthroat1"`, `"cutthroat2"`, `"cutthroat3"`, `"rainbow1"`, `"rainbow2"`, `"rainbow3"`, `"greenback"`
#' @param n number of desired colors in palette; defaults to all colors in given palette.
#' @param type either `"continuous"` or `"discrete"` (default). Using `"continuous"` will automatically interpolate between colors.
#' @importFrom graphics rect par image text
#'
#' @return a vector of colors
#' @export
#' @examples
#' ggtrout_palette(name = "brook1", type = "continuous")
#' ggtrout_palette(name = "rainbow3", n = 3)
#'
ggtrout_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  pal <- ggtrout_palettes[[name]][[1]]

  if (is.null(pal))
    stop("Trout palette not found!")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("There aren't enough colors in the selected trout palette!")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' List whether palette is qualitative, diverging, or monochromatic
#'
#' @param name list type of given palette (e.g., `"brook_div"`), list all palettes of desired type (e.g., `"monochromatic"`), or list types of all (`"all"`; default)
#'
#' @return prints types of palettes
#' @export
ggtrout_type <- function(name = "all") {
  result <- sapply(ggtrout_palettes, "[[", 2)
  df <- as.data.frame(result) %>%
    tibble::rownames_to_column(var = "pal_name")

  if (name == "all") {
    result <- result
  }
  else if (name == "diverging" | name == "monochromatic" | name == "qualitative") {
    result <- df %>%
      dplyr::filter(result == name) %>%
      dplyr::pull("pal_name")
  }
  else {
    result <- df %>%
      dplyr::filter(pal_name == name) %>%
      dplyr::pull("result")
  }
  print(result)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  # image(x and y are gridlines,
  # z has values for colors)
  graphics::image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  graphics::rect(0, 0.9, n + 1, 1.1, col = grDevices::rgb(1, 1, 1, 0.8), border = NA)
  graphics::text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1)
}

#' Check whether ggtrout palettes are colorblind friendly
#' Uses the \link[colorblindcheck]{palette_check} function
#'
#' @param name name of ggtrout palette (e.g., `"brook1"`)
#'
#' @return values for color vision deficiencies
#' @export
ggtrout_cb <- function(name) {
  pal <- ggtrout_palette("rainbow1")
  colorblindcheck::palette_check(pal)
}

#' Grid several palettes for README
#'
#' @param family trout (sub)species name (options are "brook", "cutthroat" (includes greenback), or "rainbow"; can also do "all" to print all palettes)
#'
#' @return prints ggplots for all palettes within a given family
#' @export
grid_palettes <- function(family) {
  if (family == "brook") species <- c("brook1", "brook2", "brook3")
  if (family == "cutthroat") species <- c("cutthroat1", "cutthroat2", "cutthroat3", "greenback")
  if (family == "rainbow") species <- c("rainbow1", "rainbow2", "rainbow3")

  fishes <- 1:length(species)

  # Process palette data for each fish
  dat <-
    fishes %>%
    lapply(function(x) {
      pal <- ggtrout_palette(species[x])
      pal <- tibble::as_tibble(pal)
      vals <- sapply(pal, `[`, 1:nrow(pal))
      name <- species[x]
      return(list(pal = pal, vals = vals, name = name))
    }) %>%
    c()

  # Build plots for each fish
  plots <-
    fishes %>%
    lapply(function(x) {
      pal <- dat[[x]]
      plot_helper(pal)
    }) %>%
    c()

  # Grid plots together depending on how many palettes there are per species
  if (length(plots) == 3) {
    cowplot::plot_grid(plots[[1]], plots[[2]], plots[[3]], ncol = 1, align = "h")
  } else {
    cowplot::plot_grid(plots[[1]], plots[[2]], plots[[3]], plots[[4]], ncol = 1, align = "h")
  }
}

#' Helper function for building palette plots
#'
#' @param pal palette (output from `ggtrout_palette()` function)
#'
#' @return ggplot-type object with palette
#' @export
plot_helper <- function(pal) {
  ggplot2::ggplot(data = pal$pal, ggplot2::aes(x = 1:nrow(pal$pal), y = 1, fill = x)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_manual(values = pal$vals) +
    ggplot2::theme_void() +
    ggplot2::ggtitle(pal$name) +
    ggplot2::theme(legend.position = "none",
                   plot.title = ggplot2::element_text(hjust = 0.05, face = "bold", size = 18)) +
    ggplot2::coord_fixed()
}
