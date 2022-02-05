#' Split string and trim white space
#'
#' Trims both leading and trailing white space.
#'
#' @param x What to split, a character vector.
#' @param split What to use for splitting. Either a character vector or an
#'   object that can coerce to such.
#' @inheritDotParams base::strsplit
#' @return Split strings, a character vector.
#' @export
strsplit.trimws <- function(x, split, ...)
  unlist(lapply(strsplit(x, split, ...), trimws))

#' Types of vector
#' @param x Vector or list
#' @return Named types, vector of character
#' @export
types.of <- function(x) sapply(names(x), function(y) typeof(x[[y]]))

#' Java home based on Java binary
#'
#' Compute `JAVA_HOME` based on the current Java path. Look for Java in the
#' search path. Strip away its super-folders. Assume and assert that the first
#' super-folder matches `bin`. Fail if it does *not* match.
#'
#' ```r
#' bin.java <- Sys.which("java")
#' home.bin <- dirname(bin.java)
#' stopifnot(basename(home.bin) == "bin")
#' java.home <- dirname(home.bin)
#' ```
#'
#' The `bin` super-folder's parent is Java _home_.
#'
#' @param bin_java Path to Java binary.
#' @export
Sys.java_home <- function(bin_java = Sys.which("java")) {
  home_bin <- dirname(bin_java)
  stopifnot(basename(home_bin) == "bin")
  dirname(home_bin)
}

#' Set Java home based on Java binary
#'
#' Stops if `java_home` is not a currently existing directory.
#' @param java_home New path for `JAVA_HOME`.
#' @export
Sys.setenv_java_home <- function(java_home = Sys.java_home()) {
  stopifnot(dir.exists(java_home))
  Sys.setenv(JAVA_HOME = java_home)
}
