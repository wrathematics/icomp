#' Calculates the ICOMP criterion for a linear model.
#' 
#' This package calculates the ICOMP criterion value for linear models as well
#' as the ICOMP variations, ICOMPr and ICOMPcv.
#' 
#' \tabular{ll}{ Package: \tab icomp\cr Type: \tab Package\cr Version: \tab
#' 0.1\cr Date: \tab 2008-07-03\cr % License: \tab What license is it under?\cr
#' }
#' 
#' The function ICOMP calls ICOMP.lm, ICOMPr.lm and ICOMPcv.lm to calculate
#' each criterions value and then presents the output in a data frame.
#' 
#' @name icomps-package
#' @aliases icomps-package icomps
#' @docType package
#' @author Drew Schmidt and Jake Ferguson
#' 
#' Maintainer: Drew Schmidt <wrathematics@@gmail.com>
#' 
#' @references Bozdogan, H. Haughton, D.M.A (1998). Information complexity
#' criteria for regression models. Computation Statistics & Data Analysis 28:
#' 51-76
#' 
#' @useDynLib icomp, R_tr, R_sumprod
#' 
#' @keywords package models regression
NULL
