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
  ind <- 1:rank
  
  inv.matrix <- chol2inv(object$qr$qr[ind, ind, drop=FALSE])
  sigma <- sigma_lm(object)
  covmat <- sigma*sigma*inv.matrix
  
  k <- rank + 1
  icomp <- -2*lLik + compute_complexity(covmat, complexity, k)
  
  icomp
}



#' @param cplex
#' Complexity measure, as a string.  Valid options are "C0", "C1", 
#' "C1F", and "COND", the latter being condition number.
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
ICOMP.lm <- function(object, ..., cplex="C1")
{
  complexities <- c("C0", "C1", "C1F", "COND")
  complexity <- match.arg(toupper(cplex), complexities)
  
  if (missing(...))
    return(ICOMP_lm(object, complexity))
  
  call <- match.call()
  multimodel(list(object, ...), call, ICOMP_lm, complexity)
}
