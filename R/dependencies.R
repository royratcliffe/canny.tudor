#' Dependent packages
#'
#' Finds \code{\link[R.oo]{Package}} objects for all dependencies of \code{pkgs}.
#'
#' @inheritDotParams gtools::getDependencies
#' @return List of \code{\link[R.oo]{Package}} dependencies.
#' @export
#' @examples
#' library(R.oo)
#' methods(class = "Package")
#' #  [1] as.character        getAuthor           getBundle           getBundlePackages
#' #  [5] getChangeLog        getClasses          getContents         getContribUrl
#' #  [9] getDataPath         getDate             getDescription      getDescriptionFile
#' # [13] getDevelUrl         getDocPath          getEnvironment      getExamplePath
#' # [17] getHistory          getHowToCite        getLicense          getMaintainer
#' # [21] getName             getNews             getPath             getPosition
#' # [25] getTitle            getUrl              getVersion          isLoaded
#' # [29] isOlderThan         ll                  load                showChangeLog
#' # [33] showContents        showDescriptionFile showHistory         showHowToCite
#' # [37] showNews            startupMessage      unload
#'
#' dependentPackages("dplyr") |> tibble::enframe(value = "package")
dependentPackages <- function(...)
  Map(R.oo::Package, gtools::getDependencies(...))
