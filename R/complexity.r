compute_complexity <- function(cov.matrix,  complexity, k)
{
  if (complexity == "C0")
    tr(cov.matrix, logs=TRUE) - log(det(cov.matrix))
  else if (complexity == "C1")
    k*log(tr(cov.matrix)/k) - log(det(cov.matrix))
}
