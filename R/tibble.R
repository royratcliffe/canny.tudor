#' Types of tibble or data frame
#' @param x Tibble or data frame
#' @return Named types, vector of character
#' @export
types.of <- function(x) sapply(names(x), function(y) typeof(x[[y]]))
