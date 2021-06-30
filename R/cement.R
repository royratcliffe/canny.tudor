#' Cement argument names into list of strings
#'
#' The arguments must not contain assignments, only symbols.
#'
#' @param ... Arbitrary symbols
#' @return List of strings
#' @export
cement_as_string <- function(...)
  purrr::map(rlang::ensyms(...), rlang::as_string)
