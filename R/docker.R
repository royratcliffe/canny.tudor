#' Home directory's docker configuration
#'
#' Begins with full-stop (dot) in order not to overlap "docker config" as a
#' command. The latter manages Docker configurations, while this function reads
#' only the calling user's configuration file.
#' @export
.docker_config <- function()
  jsonlite::fromJSON(file(.docker_config.json))

.docker_config.json <- fs::path_home(".docker", "config.json")

#' System-wide Docker information
#'
#' @return List of system-wide information pairs. There are some 60 pairs, typically.
#' @export
docker_system_info <- function() docker("system", "info")

#' Docker information
#'
#' Synonym for Docker \emph{system} information.
#' @export
docker_info <- function() docker("info")

#' Run Docker
#' @param ... Docker arguments
#' @export
docker <- function(...)
  jsonlite::fromJSON(
    system2("docker", args = c(..., "-f", '"{{json .}}"'), stdout = TRUE))
