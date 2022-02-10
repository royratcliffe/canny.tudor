#' Copy from one environment to another
#'
#' Performs only shallow copy; does _not_ recurse when a name pairs with a
#' sub-environment.
#'
#' @param from.envir Environment to copy from
#' @param to.pos `-1L` for the calling environment
#' @param to.envir Environment to copy to
#' @export
copy.env <- function(from.envir,
                     to.pos = -1L,
                     to.envir = as.environment(to.pos),
                     all.names = FALSE) {
  for (x in ls(from.envir, all.names = all.names)) {
    assign(x, get(x, from.envir), to.envir)
  }
}
