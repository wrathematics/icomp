# compute twice the complexity
compute_complexity <- function(cov.matrix, complexity, k)
{
  if (complexity == "C0")
    tr(cov.matrix, logs=TRUE) - log(det(cov.matrix))
  else if (complexity == "C1")
    k*log(tr(cov.matrix)/k) - log(det(cov.matrix))
  else if (complexity == "C1F")
  {
    lambdas <- eigen(cov.matrix, only.values=TRUE)$values
    lambda_bar <- mean(lambdas)
    .5/(lambda_bar*lambda_bar) * sum((lambdas - lambda_bar)^2)
  }
  else if (complexity == "COND")
    .5*kappa(cov.matrix)
}
