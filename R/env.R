#' Copy from one environment to another
#' @param from.envir Environment to copy from
#' @param to.pos `-1L` for the calling environment
#' @param to.envir Environment to copy to
#' @export
copy.env <- function(from.envir,
                     to.pos = -1L,
                     to.envir = as.environment(to.pos)) {
  for (x in ls(from.envir)) {
    assign(x, get(x, from.envir), to.envir)
  }
}
