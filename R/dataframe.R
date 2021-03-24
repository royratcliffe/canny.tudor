#' Permutations of p-q pairs.
#'
#' Permutes a pair of variables, p and q, by a data frame such that each frame
#' row contains a unique p-q permutation.
#'
#' @param v Source vector.
#' @return Permutation frame.
#' @export
#' @examples
#' p.q.frame(c("a", "b"))
#' #>   p q
#' #> 1 a b
#' #> 2 b a
#'
#' p.q.frame(1:3)
#' #>   p q
#' #> 1 1 2
#' #> 2 1 3
#' #> 3 2 1
#' #> 4 2 3
#' #> 5 3 1
#' #> 6 3 2
p.q.frame <- function(v = vector()) {
  m <- gtools::permutations(length(v), 2, v = v)
  colnames(m) <- c("p", "q")
  as.data.frame(m)
}

#' @export
permuted.Arimas <- function(x, v = 0:5, lambda = 0) {
  p.q.frame(v) %>%
    rowwise() %>%
    mutate(arima = list(Arima(x, order = c(p, 0, q), lambda = lambda))) %>%
    mutate(aic = arima$aic) %>%
    arrange(aic)
}
