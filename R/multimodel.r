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
