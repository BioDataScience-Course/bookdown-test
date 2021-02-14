# This bookdown in its version 2020 needs the following R packages
#  R 3.6.3

# From CRAN
install.packages(c("knitr", "bookdown", # The bases!
  "gdtools", "svglite", # SVG graphs
  "htmltools", "vembedr", # To embed videos easily
  "devtools", # To install packages from Github
  "broom",
  "car",
  "DiagrammeR",
  "DT",
  "fortunes",
  "GGally",
  "ggplot2",
  "ggpubr",
  "ggridges",
  "glue",
  "knitr",
  "lmerTest",
  "multcomp",
  "nparcomp",
  "pander",
  "pwr",
  "rmarkdown",
  "scales",
  "sessioninfo",
  "skimr",
  "vembedr"
))

# From Github (latest devel version)
devtools::install_github("SciViews/flow")
devtools::install_github("SciViews/data")
devtools::install_github("SciViews/chart")
devtools::install_github("SciViews/SciViews")
devtools::install_github("SciViews/learndown")
devtools::install_github("rstudio/bookdown")
