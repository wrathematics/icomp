sigma_lm <- function(mdl)
{
  r <- mdl$residuals
  
  if (is.null(mdl$weights))
    rss <- sumprod(r, r)
  else
    rss <- sumprod(mdl$weights, r*r)
  
  sqrt(rss / mdl$df.residual)
}



ICOMP_lm <- function(object, complexity)
{
  lLik <- c(logLik(object))
  
  rank <- object$rank
  rnk <- 1:rank
  
  inv.matrix <- chol2inv(object$qr$qr[rnk, rnk, drop=FALSE])
  sigma <- sigma_lm(object)
  cov.matrix <- sigma*sigma*inv.matrix
  
  k <- rank + 1
  icomp <- -2*lLik + compute_complexity(cov.matrix, complexity, k)
  
  icomp
}



#' @param complexity
#' Complexity measure, as a string.  Valid options are "C1".
#' 
#' @examples
#' \dontrun{
#' ### Modified from the example in ?AIC
#' lm1 <- lm(Fertility ~ . , data = swiss)
#' lm2 <- update(lm1, . ~ . -Examination)
#' 
#' icomp::ICOMP(lm1, lm2)
#' }
#' 
#' @importFrom stats logLik
#' 
#' @rdname ICOMP
#' @method ICOMP lm
#' @export
ICOMP.lm <- function(object, ..., complexity="C1")
{
  complexity <- match.arg(toupper(complexity), c("C0", "C1"))
  
  if (missing(...))
    return(ICOMP_lm(object, complexity))
  
  call <- match.call()
  multimodel(list(object, ...), call, ICOMP.lm, complexity)
}
