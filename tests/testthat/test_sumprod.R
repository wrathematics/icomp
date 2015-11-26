context("Test sumprod functionality works")

test_that("sumprod output is analogous to R-side sumprod code", {
  
  # Define/grab functions
  sumprod1 <- function(x, y) sum(x*y)
  sumprod2 <- sumprod
  
  # Get data
  set.seed(1234)
  x <- rnorm(10)
  y <- rnorm(10)
  
  # Check that a run through sumprod1 == a run through sumprod2
  expect_true(all.equal(sumprod1(x, y), sumprod2(x, y)))
  
  # Check it works for integer and mixed types, too
  expect_true(all.equal(sumprod1(x, x), sumprod2(x, x)))
  expect_true(all.equal(sumprod1(y, y), sumprod2(y, y)))
  expect_true(all.equal(sumprod1(as.integer(x), y), sumprod2(as.integer(x), y)))
  expect_true(all.equal(sumprod1(x, as.integer(y)), sumprod2(x, as.integer(y))))
  expect_true(all.equal(sumprod1(as.integer(x), as.integer(y)), sumprod2(as.integer(x), as.integer(y))))
  
})
