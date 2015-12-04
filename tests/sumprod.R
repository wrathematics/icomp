sumprod1 <- function(x, y) sum(x*y)
sumprod2 <- icomp:::sumprod

set.seed(1234)
x <- rnorm(10)
y <- rnorm(10)

test <- function(x, y) 
  stopifnot(all.equal(sumprod1(x, y), sumprod2(x, y)))

test(x, x)
test(x, y)
test(y, y)
test(as.integer(x), y)
test(x, as.integer(y))
test(as.integer(x), as.integer(y))
