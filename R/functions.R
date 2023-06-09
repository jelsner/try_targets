get_data <- function(file) {
  readr::read_csv(file, col_types = readr::cols()) |>
    dplyr::filter(!is.na(Ozone))
}

fit_model <- function(data) {
  lm(Ozone ~ Temp, data) |>
    coefficients()
}

plot_model <- function(model, data) {
  ggplot(data) +
    geom_point(aes(x = Temp, y = Ozone)) +
    geom_abline(intercept = model[1], slope = model[2]) +
    theme_gray(16)
}