# Learndown configuration and functions
learndown <- list(
  baseurl = "https://wp.sciviews.org", # The base URL for the site
  shiny_imgdir = "images/shinyapps",   # The Shiny image directory (screenshots)
  svbox = 2020,                        # The SciViews Box version used
  rstudio = "start_rstudio2020.html",  # Run Rstudio from the box
  package = "BioDataScience1",         # Associated package for the exercices
  institutions = "UMONS",              # Known institutions
  courses = c(
    "S-BIOG-006",                      # SDD1 Q1 & (Q2 = S-BIOG-027, pas utilisé
    "S-BIOG-921"                       # SDD1 Charleroi
  ),
  courses_names = c(
    "Science des Données Biologiques I à l'UMONS",
    "Bioinformatique et Science des Données à Charleroi"
  )
)

## h5p(), launch_shiny(), learnr() & assignation() for exercises blocks, use:
#
# `r h5p(x, toc = "Short description")`
#
# `r launch_shiny(url, toc = "Short description")`
#
# `r learnr(id, title = "...", toc = "Short description")`
#
#```{r, echo=FALSE, results='asis'}
#assignation("A01a_markdown", part = NULL,
#  url = "https://github.com/BioDataScience-Course/sdd1_module01",
#  course.urls = c(
#    'S-BIOG-006' = "https://classroom.github.com/a/...",
#    'S-BIOG-921' = "https://classroom.github.com/a/..."),
#  toc = "Assignation : réalisation d'un premier document en Markdown")
#```
#
# Then, at the end of the module, create the exercises toc with:
#
# `r show_ex_toc()`

h5p <- function(id, toc = "", ...)
  learndown::h5p(id, toc = toc, baseurl = learndown$baseurl,
    toc.def = "Exercice H5P {id}",
    h5p.img = "images/list-h5p.png",
    h5p.link = paste(learndown$baseurl, "h5p", sep = "/"), ...)

launch_shiny <- function(url, toc = "", fun = paste(learndown$package, "runApp", sep = "::"),
  #ENalt1 = "*Click to start the Shiny application*",
  alt1 = "*Cliquez pour lancer l'application Shiny.*",
  #ENalt2 = "*Click to start or [run `{run.cmd}`]({run.url}{run.arg}) in RStudio.*",
  alt2 = "*Cliquez pour lancer ou [exécutez dans RStudio]({run.url}{run.arg}) `{run.cmd}`.*", ...)
  learndown::launch_shiny(url = url, toc = toc, imgdir = learndown$shiny_imgdir,
    fun = fun, alt1 = alt1, alt2 = alt2, toc.def = "Application Shiny {app}",
    run.url = paste(learndown$baseurl, "/", learndown$rstudio,  "?runrcode=", sep = ""),
    app.img = "images/list-app.png",
    app.link = paste(learndown$baseurl, "shiny_app", sep = "/"), ...)

# Note: not used yet!
launch_learnr <- function(url, toc = "", fun = paste(learndown$package, "run", sep = "::"), ...)
  launch_shiny(url = url, toc = toc, fun = fun, ...)

learnr <- function(id, title = NULL, toc = "", package = learndown$package,
text = "Effectuez maintenant les exercices du tutoriel")
  learndown::learnr(id = id, title = title, package = package, toc = toc,
    text = text, toc.def = "Tutoriel {id}",
    rstudio.url = paste(learndown$baseurl, learndown$rstudio, sep = "/"),
    tuto.img = "images/list-tuto.png",
    tuto.link = paste(learndown$baseurl, "tutorial", sep = "/"))

# Note: use course.urls = c(`S-BIOG-006` = "classroom url1", `S-BIOG-921` = "classroom url2"), and url = link to Github template repository for the assignation
assignation <- function(name, url, course.urls = NULL, part = NULL, toc = "",
texts = learndown::assignation_fr(course = "Assignation GitHub Classroom pour les \u00e9tudiants inscrits au cours de"))
  learndown::assignation(name = name, url = url, course.urls = course.urls,
    part = part, course.names = stats::setNames(learndown$courses_names,
      learndown$courses),
    toc = toc, texts = texts, assign.img = "images/list-assign.png",
    assign.link = paste(learndown$baseurl, "github_assignation", sep = "/"))

show_ex_toc <- function(header = "", clear.it = TRUE)
  learndown::show_ex_toc(header = header, clear.it = clear.it)

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
