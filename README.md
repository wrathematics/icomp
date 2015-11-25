# icomp

* **Version:** 0.2.0
* **Author:** Drew Schmidt and Jake Ferguson


This package implements Bozdogan's Information Complexity (ICOMP) criterion.  Currently only linear models are supported.



## Example Usage

```r
### Modified from the example in ?AIC
lm1 <- lm(Fertility ~ . , data = swiss)
lm2 <- update(lm1, . ~ . -Examination)

icomp::ICOMP(lm1, lm2)
## ICOMP.lm
## lm1 353.4176
## lm2 348.6639
```



## Installation

Using the devtools package: 

```r
devtools::install_github("wrathematics/icomp")
```
