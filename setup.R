# Learndown configuration and functions
learndown <- list(
  baseurl = "https://wp.sciviews.org", # The base URL for the site
  shiny_imgdir = "images/shinyapps",   # The Shiny image directory (screenshots)
  svbox = 2020,                        # The SciViews Box version used
  institutions = "UMONS",              # Known institutions
  courses = c(
    "S-BIOG-006", "S-BIOG-027",        # SDD1 Q1 & Q2
    "S-BIOG-921"                       # SDD1 Charleroi
  )
)

h5p <- function(id, ...)
  learndown::h5p(id, baseurl = learndown$baseurl, ...)

launch_shiny <- function(url, fun = "BioDataScience::runApp",
  #ENalt1 = "*Click to start the Shiny application*",
  alt1 = "*Cliquez pour lancer l'application Shiny*",
  #ENalt2 = paste0(
  #EN  "*Click to start or run `{fun}(\"{app}\")` in the svbox",
  #EN  learndown$svbox, ".*"), ...)
  alt2 = paste0(
    "*Cliquez pour lancer ou exécutez `{fun}(\"{app}\")` dans la svbox",
    learndown$svbox, ".*"), ...)
  learndown::launch_shiny(url = url, imgdir = learndown$shiny_imgdir, fun = fun,
    alt1 = alt1, alt2 = alt2, ...)

launch_learnr <- function(url, fun = "BioDataScience::run", ...)
  launch_shiny(url = url, fun = fun, ...)

# Include javascript and css code for {learndown} additional features
# in style.css and header.html, respectively
learndown::learndown_init(
  baseurl = learndown$baseurl,
  #EN hide.code.msg = "See the code",
  hide.code.msg = "Voir le code",
  institutions = learndown$institutions,
  courses = learndown$courses)


# Knitr default options
knitr::opts_chunk$set(comment = "#", fig.align = "center")
