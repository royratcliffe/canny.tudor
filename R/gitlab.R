#' Sets up a connection to gitlab.com using GITLAB_PRIVATE_TOKEN
#'
#' @inheritDotParams gitlabr::gl_connection
#' @export
set.gitlab.connection <- function(...)
  gitlabr::set_gitlab_connection(
    gitlabr::gl_connection("https://gitlab.com",
                           Sys.getenv("GITLAB_PRIVATE_TOKEN"), ...))

#' Lists maintainer-level projects using default GitLab connection
#'
#' @inheritDotParams gitlabr::gl_list_projects
#' @export
list.gitlab.maintainer.projects <- function(...)
  gitlabr::gl_list_projects(..., min_access_level = 40)

#' Lists owner-level projects using default GitLab connection
#'
#' @inheritDotParams gitlabr::gl_list_projects
#' @export
list.gitlab.owner.projects <- function(...)
  gitlabr::gl_list_projects(..., min_access_level = 50)

#' Gets project identifier as integer
#'
#' You can use the extra arguments to filter the incoming project tibble by path
#' or other criteria.
#'
#' @inheritDotParams dplyr::filter
#' @importFrom magrittr %>%
#' @export
#' @examples
#' \dontrun{
#' list.gitlab.maintainer.projects() %>%
#'   get.gitlab.project.id(path == "path-of-gitlab-project")
#' }
get.gitlab.project.id <- function(...)
  dplyr::filter(...) %>%
  dplyr::select(id) %>%
  dplyr::mutate(dplyr::across(id, as.integer))

globalVariables(c("id"))

#' Lists tree recursively
#'
#' Runs iteratively for all tree-type files. The tree path becomes a new path
#' for a sub-listing.
#'
#' @inheritDotParams gitlabr::gl_list_files
#' @importFrom magrittr %>%
#' @export
list.gitlab.project.files <- function(...) {
  files <- gitlabr::gl_list_files(...)
  trees <- files[files$type == "tree", ]
  while (nrow(trees) != 0) {
    rows <- lapply(trees$path, function(x)
      gitlabr::gl_list_files(..., path = x)) %>%
      dplyr::bind_rows()
    files <- dplyr::add_row(files, rows)
    trees <- rows[rows$type == "tree", ]
  }
  files
}
