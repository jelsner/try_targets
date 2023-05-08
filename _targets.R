#_targets.R file
# from https://books.ropensci.org/targets/walkthrough.html
library(targets)
source("R/functions.R")
tar_option_set(packages = c("ggplot2"))
list(
  tar_target(file, here::here("data", "data.csv"), format = "file"),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data))
)