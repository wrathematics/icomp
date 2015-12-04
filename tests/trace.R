tr1 <- function(x) sum(diag(x))
tr2 <- icomp:::tr

set.seed(1234)
x <- matrix(rnorm(30), 10)

stopifnot(all.equal(tr1(x), tr2(x)))

x <- t(x)
stopifnot(all.equal(tr1(x), tr2(x)))
