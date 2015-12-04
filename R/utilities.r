# Compute information criteria values for a list of models
# @param l list of models
# @param fun likelihood function, such as ICOMP()
multimodel <- function(l, call, fun, complexity)
{
  criteria <- sapply(l, fun, complexity=complexity)
  
  ret <- as.data.frame(criteria)
  colnames(ret) <- deparse(substitute(fun))
  row.names(ret) <- paste0(as.character(call[-1][1:length(l)]))
  ret <- cbind(Complexity=complexity, ret)
  
  ret
}



# trace
tr <- function(x) .Call(R_tr, x, logs=FALSE)



# sum(x*y)
sumprod <- function(x, y)
{
  if (!is.numeric(x) || !is.numeric(y))
    stop("arguments 'x' and 'y' must be numeric")
  
  .Call(R_sumprod, x, y)
}
