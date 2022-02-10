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

#' Unzip file to raw vectors
#'
#' Automatically filters out members with file names ending with a forward
#' slash. Trailing slash denotes a sub-directory.
#'
#' @param x Name of zip file.
#' @param ... Ignored parameters.
#' @export
unzip_bin.character <- function(x, ...) {
  ziplist <- zip::zip_list(x)
  dir <- tempdir()
  filenames <- ziplist$filename[!grepl("/$", ziplist$filename)]
  bins <- lapply(filenames, function(filename) {
    zip::unzip(x, filename, junkpaths = TRUE, exdir = dir)
    junk <- file.path(dir, basename(filename))
    on.exit(unlink(junk))
    xfun::read_bin(junk)
  })
  names(bins) <- filenames
  bins
}

#' Raw unzip to raw vectors
#' @param x Raw zip vector to unzip.
#' @param ... Ignored parameters.
#' @return List of member raw vectors.
#' @export
unzip_bin.raw <- function(x, ...) {
  zipfile <- tempfile()
  on.exit(unlink(zipfile))
  writeBin(x, zipfile, useBytes = TRUE)
  unzip_bin(zipfile)
}

#' Unzip to raw vectors
#' @param x Name of zip file or raw zip vector.
#' @param ... Passed to method.
#' @export
unzip_bin <- function(x, ...) {
  UseMethod("unzip_bin", x)
}

#' Vectorised unzip to raw vectors
#' @param x Vector of zip files either by name or by raw vector.
#' @inheritDotParams unzip_bin
#' @return Zipper list of member lists of raw vector. Does *not* attempt to
#'   simplify the resulting list of lists of raw vectors. Consistency makes this
#'   useful since sub-lists can easily have different file names.
#' @export
#' @examples
#' # Note the trailing dollar in the pattern below. Only matches path names
#' # ending with `zip` extension.
#' zippers <- canny.tudor::vunzip_bin(list.files(pattern = "*.zip$"))
#'
#' # This is how you might iterate the resulting list of lists, of zippers of
#' # members, using nested `for` loops.
#' for (i in seq_along(zippers)) {
#'   members <- zippers[[i]]
#'   for (j in seq_along(members)) {
#'     cat(paste(names(zippers)[[i]], names(members)[[j]], sep = ":"),
#'         length(members[[j]]), "\n")
#'   }
#' }
vunzip_bin <- Vectorize(unzip_bin, "x", SIMPLIFY = FALSE)
