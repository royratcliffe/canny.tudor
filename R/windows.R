#' Windows User Variables
#' @export
#' @examples
#' \dontrun{
#' Windows.user_variables()$Path
#' }
Windows.user_variables <- function() {
  utils::readRegistry("Environment", "HCU")
}

#' Windows System Variables
#' @export
#' @examples
#' \dontrun{
#' Windows.system_variables()$Path
#' }
Windows.system_variables <- function() {
  utils::readRegistry(Windows.registry_path(
    "SYSTEM", "CurrentControlSet", "Control", "Session Manager", "Environment"
  ), "HLM")
}

#' Windows Registry Path
#'
#' Constructs a Windows registry path using back-slash delimiters. The default
#' file path separator is \emph{not} back-slash on Windows, but forward-slash
#' instead.
#'
#' @param ... Registry path components, one or more.
#' @returns Back-slash delimited registry path.
#' @export
Windows.registry_path <- function(...) {
  file.path(..., fsep = "\\")
}
