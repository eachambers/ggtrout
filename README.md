# ggtrout, made for those obsessed with trout coloration

This package XXX

## Installation

The ggtrout package is only available on Github, and so must be installed using the `devtools` package. To do so:

```{r install}
devtools::install_github("eachambers/ggtrout")
```

## Usage

```{r usage}
# Load library
library(ggtrout)

# See all available palettes
names(ggtrout)
```

## Palettes

In total, there are XXX palettes available in the ggtrout package, each named for the species for which the palette is based on. XX are qualitative, XXX are diverging, and XXX are monochromatic. You can have the package tell you which is which using the `ggtrout_types()` function. For example:

```{r palette types}
# See all available diverging palettes
ggtrout_types("diverging")
```

### Brook trout

Brook trout (*Salvelinus fontinalis*), when breeding, have bright orange-red pelvic and pectoral fins and brilliant red lateral spots ringed with grey-blue on a yellow-green background. There are XXX palettes based on "brookies": one qualitative, one diverging, and one monochromatic.

```{r brookie}
ggtrout("Brook1")
ggtrout("Brook2")
ggtrout("Brook3")
```

### Cutthroat trout

#<img src="photos/Zoology.jpeg" align="center" height="500"/>

Cutthroat throat (*Oncorhynchus clarkii*) are named for their bright blood-red fin arch Life Histories is a diverging palette, inspired by TODO

```{r life hist}
ggtrout("Cutthroat1")
```
## Examples

Below are some examples of the ggtrout palettes. As you can see, you can adapt these palettes for use in `ggplot2()` using TODO functions.

## Acknowledgements

Much of my code, and the general structure of this package, was inspired by the `wesanderson` package developed by Karthik Ram (find it [here](https://github.com/karthik/wesanderson)), and the `NatParksPalettes` package developed by Kevin Blake (find it [here](https://github.com/kevinsblake/NatParksPalettes)). For advice on use of color in data visualization, I highly recommend the wonderful, and fully open access, *Fundamentals of Data Visualization* textbook by Claus Wilke, available online [here](https://clauswilke.com/dataviz/).
