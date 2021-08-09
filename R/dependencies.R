#' Dependent packages
#'
#' Finds \code{\link[R.oo]{Package}} objects for all dependencies of \code{pkgs}.
#'
#' @inheritDotParams gtools::getDependencies
#' @return List of \code{\link[R.oo]{Package}} dependencies.
#' @export
dependentPackages <- function(...)
  Map(R.oo::Package, gtools::getDependencies(...))
