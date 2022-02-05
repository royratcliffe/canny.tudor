#' All sub-class methods
#' @param x Object with class
#' @return Methods by sub-class, list of character vectors
#' @export
#' @examples
#' \dontrun{
#' all_subclass_methods(0L)
#' }
all_subclass_methods <- function(x)
  sapply(class(x), function(x)
    utils::methods(class = x), simplify = FALSE)
