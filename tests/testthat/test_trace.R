context("Test trace functionality works")

test_that("Trace output is analogous to R-side tracing code", {
  
  # Define/grab functions
  tr1 <- function(x) sum(diag(x))
  tr2 <- tr # We don't need to use ::: since (as I accidentally discovered) testthat code can grab non-exported objects
  
  # Get data
  set.seed(1234)
  x <- matrix(rnorm(30), 10)
  
  # Check that a run through tr1 == a run through tr2
  expect_true(all.equal(tr1(x), tr2(x)))
  
  # Check it works for transposed matrices too
  x <- t(x)
  expect_true(all.equal(tr1(x), tr2(x)))
})
