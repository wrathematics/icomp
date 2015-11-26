# Compute information criteria values for a list of models
# @param l list of models
# @param fun likelihood function, such as ICOMP()
multimodel <- function(l, call, fun)
{
  criteria <- sapply(l, fun)
  
  ret <- as.data.frame(criteria)
  colnames(ret) <- deparse(substitute(fun))
  row.names(ret) <- as.character(call[-1L])
  
  ret
}



# trace
tr <- function(x) .Call(R_tr, x)



# sum(x*y)
sumprod <- function(x, y)
{
  if (!is.numeric(x) || !is.numeric(y))
    stop("arguments 'x' and 'y' must be numeric")
  if (length(x) != length(y))
    stop("arguments 'x' and 'y' must be vectors of the same length")
  
  if (is.double(x))
  {
    if (is.integer(y))
      storage.mode(y) <- "double"
    
    .Call(R_sumprod_real, x, y)
  }
  else if (is.double(y))
  {
    storage.mode(x) <- "double"
    
    .Call(R_sumprod_real, x, y)
  }
  else
    .Call(R_sumprod_int, x, y)
}
