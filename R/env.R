#' Copy from one environment to another
#' @param from.env Environment to copy from
#' @param to.env Environment to copy to
#' @export
copy.env <- function(from.env, to.env) {
  for (x in ls(from.env)) {
    assign(x, get(x, from.env), to.env)
  }
}
