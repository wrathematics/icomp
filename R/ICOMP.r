#' ICOMP
#' 
#' Generic function for calculating Bozdogan's information complexity
#' measure (ICOMP).  ICOMP is a likelihood-based criterion similar
#' to Akaike's Information Criterion (AIC).  As with AIC, 
#' a smaller ICOMP value corresponds to a better model.
#' 
#' @param object
#' A model for which there is a method for \code{stats::logLik()}.
#' Currently supports \code{lm} objects.
#' @param ...
#' Additional arguments.
#' 
#' @return
#' The ICOMP value for the given model.
#' 
#' @author Jake Ferguson and Drew Schmidt
#' 
#' @references Bozdogan, H. Haughton, D.M.A (1998). Information complexity
#' criteria for regression models. Computation Statistics & Data Analysis 28:
#' 51-76
#' 
#' @keywords models regression
#' @rdname ICOMP
#' @export
ICOMP <- function(object, ...) UseMethod("ICOMP")
