
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtrout

Are you so obsessed with trout that you want to incorporate their
coloration into your data visualizations? Look no further! This package
provides ten color palettes inspired by several species (and subspecies)
of trout that inhabit pristine habitats across the United States. The
package’s framework is designed for use in the tidyverse but can be used
for base R plotting as well.

## Installation

------------------------------------------------------------------------

The ggtrout package is only available on GitHub and so must be installed
using the devtools package like so:

``` r
devtools::install_github("eachambers/ggtrout")
```

## Usage

------------------------------------------------------------------------

``` r
# Load library
library(ggtrout)

# See all available palettes
names(ggtrout_palettes)
#>  [1] "brook1"     "brook2"     "brook3"     "cutthroat1" "cutthroat2"
#>  [6] "cutthroat3" "rainbow1"   "rainbow2"   "rainbow3"   "greenback"
```

There are 10 palettes available in the ggtrout package, each named based
on the species for which the palette is inspired. Five are qualitative,
three are diverging, and two are monochromatic. You can have the package
tell you which is which using the `ggtrout_types()` function. For
example:

``` r
library(dplyr)
library(tibble)

# For an individual palette's type:
ggtrout_type("rainbow2")
#> [1] "diverging"

# For only monochromatic palettes:
ggtrout_type("monochromatic")
#> [1] "brook2"     "cutthroat2"

# For all palettes:
ggtrout_type("all")
#>          brook1          brook2          brook3      cutthroat1      cutthroat2 
#>   "qualitative" "monochromatic"     "diverging"   "qualitative" "monochromatic" 
#>      cutthroat3        rainbow1        rainbow2        rainbow3       greenback 
#>     "diverging"   "qualitative"     "diverging"   "qualitative"   "qualitative"
```

You can check the degree of colorblind friendliness for each of the
ggtrout palettes using the `ggtrout_cb()` function. In general, the
diverging palettes (i.e., “brook1”, “cutthroat1”, and “rainbow1”) are
the most colorblind friendly. This function uses the `palette_check()`
function in the colorblindcheck package; a general rule of thumb is to
select palettes that have a min_dist of \~8 for all color vision
deficiencies.

``` r
library(colorblindcheck)

ggtrout_cb("brook1")
#>           name n tolerance ncp ndcp  min_dist mean_dist max_dist
#> 1       normal 8  11.02395  28   28 11.023953  21.09850 33.82429
#> 2 deuteranopia 8  11.02395  28   24  5.287604  19.59110 31.99118
#> 3   protanopia 8  11.02395  28   25  7.137733  19.29605 32.59222
#> 4   tritanopia 8  11.02395  28   26  8.509960  21.03258 41.47271
```

## Palettes

------------------------------------------------------------------------

Let’s go through all the palettes, grouped by (sub)species.

### Brook trout

Brook trout (*Salvelinus fontinalis*), when breeding, have bright
orange-red pelvic and pectoral fins and brilliant red lateral spots
ringed with a grey-blue. There are three brookie-inspired palettes.

``` r
ggtrout_palette("brook1")
#> [1] "#df3d3a" "#d9bb01" "#e0902e" "#92a1c6" "#757877" "#563c2a" "#babfb4"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "brook1"
```

``` r
ggtrout_palette("brook2")
#> [1] "#ac7d0d" "#bd9500" "#d9bb01" "#e8ce63" "#edd68b"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "brook2"
```

``` r
ggtrout_palette("brook3")
#> [1] "#ac7d0d" "#bd9500" "#d9bb01" "#e8ce63" "#ffd1b3" "#f3a567" "#e68114"
#> [8] "#eb6036" "#df3d3a"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "brook3"
```

### Cutthroat trout

Cutthroat trout (*Oncorhynchus clarkii*) are named for their bright
blood-red fin arch coloration. This species has many subspecies, and the
ggtrout package is inspired by two Coloradan subspecies: the Colorado
River cutthroat (*O. c. pleuriticus*) and the greenback cutthroat (*O.
c. stomias*). The greenback has a fun history: it was presumed extinct
in the 1930s until its rediscovery in a restricted river basin in
Colorado in 1957. Since then, massive conservation efforts have been
focused on reintroducing the subspecies into its historic range; the
greenback is also the state fish of Colorado! There are four
cuttie-inspired palettes.

``` r
ggtrout_palette("cutthroat1")
#> [1] "#e8d089" "#eeb054" "#715852" "#ea5c2e" "#cb7086" "#886c54" "#969cad"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "cutthroat1"
```

``` r
ggtrout_palette("cutthroat2")
#> [1] "#81654d" "#a6885b" "#e8ab51" "#f2b851" "#f4c444" "#e8d089"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "cutthroat2"
```

``` r
ggtrout_palette("cutthroat3")
#> [1] "#e8ab51" "#f2b851" "#f4c444" "#e8d089" "#dab78d" "#c3a491" "#9f8878"
#> [8] "#a47e74" "#715852"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "cutthroat3"
```

``` r
ggtrout_palette("greenback")
#> [1] "#3e474a" "#626d5d" "#877956" "#d5ca99" "#b8ae8b" "#aa928d" "#b08848"
#> [8] "#b65f31"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "greenback"
```

### Rainbow trout

Rainbow trout (*Oncorhynchus mykiss*) is a widely distributed species
that has been introduced to freshwater habitats across the U.S. so it’s
generally a little less exciting than the other trout. Their coloration
is quite stunning though! There are three rainbow-inspired palettes.

``` r
ggtrout_palette("rainbow1")
#> [1] "#799dc7" "#bbb0e7" "#897dca" "#b0ccea" "#727c8a" "#cdd3d6" "#baa5a7"
#> [8] "#847d6d"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "rainbow1"
```

``` r
ggtrout_palette("rainbow2")
#> [1] "#727c8a" "#7d899b" "#b5bec8" "#cdd3d6" "#dbe2de" "#b0ccea" "#93abd8"
#> [8] "#9ba0d2" "#7884c4"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "rainbow2"
```

``` r
ggtrout_palette("rainbow3")
#> [1] "#5f6853" "#abb285" "#ccb3d7" "#88a1c6" "#f39e87" "#9d9995" "#906530"
#> [8] "#ad4738"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "rainbow3"
```

## Examples

------------------------------------------------------------------------

Below are some examples of using the ggtrout palettes. As you can see,
you can adapt these palettes for use in `ggplot2()`.

``` r
library(ggplot2)
library(cowplot)
library(tibble)
library(dplyr)
library(elevatr)
library(readr)
library(dataRetrieval)
library(tidyr)
theme_set(theme_cowplot())

ggplot(Orange, aes(x = circumference, y = age, color = Tree)) +
  geom_point(size = 3, alpha = 0.8) +
  scale_color_manual(values = ggtrout_palette("brook1"))
```

<img src="man/figures/README-examples-1.png" width="100%" />

``` r

pal <- ggtrout_palette("greenback", 12, type = "continuous")
image(volcano, col = pal)
```

<img src="man/figures/README-examples-2.png" width="100%" />

``` r

ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_raster(aes(fill = density), interpolate = TRUE) +
  scale_fill_gradientn(colors = ggtrout_palette("cutthroat2"))
```

<img src="man/figures/README-examples-3.png" width="100%" />

The package also has some fun Colorado-themed example datasets which can
be loaded using the `load_trout_example()` function.

``` r
load_trout_example()
#> 
#> ---------------- Example data ----------------
#>  
#> Objects loaded: 
#> *chibasin* elevation data for the Chicago Basin, CO 
#> *bluelakes* elevation data for Blue Lakes, CO 
#> *animas* Daily water temperature for the Animas River from 2016-2023 
#> 
#> -------------------------------------------------
#> 
```

Let’s take a look at the digital elevation map for the Chicago Basin and
surrounding area using a diverging palette:

``` r
pal <- ggtrout_palette("cutthroat3", 100, type = "continuous")
ggplot(chibasin, aes(x, y, fill = elevation)) +
  geom_raster() +
  coord_equal() +
  scale_fill_gradientn(colors = pal, trans = "reverse") +
  theme_void()
```

<img src="man/figures/README-chicagobasin-1.png" width="100%" />

Or the DEM for Blue Lakes using a different diverging palette:

``` r
pal <- ggtrout_palette("brook3", 100, type = "continuous")
ggplot(bluelakes, aes(x, y, fill = elevation)) +
  geom_raster() +
  coord_equal() +
  scale_fill_gradientn(colors = pal) +
  theme_void()
```

<img src="man/figures/README-bluelakes-1.png" width="100%" />

Or we could take a look at daily water temperature of the Animas River
(measured in Durango, CO) from 2016 to 2023 using a qualitative palette:

``` r
ggplot(animas, aes(x = date, y = water_temp, group = year, color = year)) +
  geom_line(alpha = 0.75) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  xlab("Date") +
  ylab("Water temperature (Celsius)") +
  ggtitle("Animas River water temperature (2016-2023)") +
  scale_color_manual(values = ggtrout_palette("rainbow3")) +
  facet_grid(~year)
```

<img src="man/figures/README-animas-1.png" width="100%" />

## Acknowledgements

------------------------------------------------------------------------

Much of my code, and the general structure of this package, was inspired
by the `wesanderson` package developed by Karthik Ram (find it
[here](https://github.com/karthik/wesanderson)), and the
`NatParksPalettes` package developed by Kevin Blake (find it
[here](https://github.com/kevinsblake/NatParksPalettes)). For advice on
use of color in data visualization, I highly recommend the wonderful and
fully open access *Fundamentals of Data Visualization* textbook by Claus
Wilke, available online [here](https://clauswilke.com/dataviz/).
