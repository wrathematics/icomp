#include <R.h>
#include <Rinternals.h>

SEXP R_sumprod_real(SEXP x_, SEXP y_)
{
  SEXP ret;
  int i;
  const int n = LENGTH(x_);
  double *x = REAL(x_);
  double *y = REAL(y_);
  double sumprod = 0.;
  
  for (i=0; i<n; i++)
    sumprod += x[i]*y[i];
  
  PROTECT(ret = allocVector(REALSXP, 1));
  REAL(ret)[0] = sumprod;
  UNPROTECT(1);
  return ret;
}



SEXP R_sumprod_int(SEXP x_, SEXP y_)
{
  SEXP ret;
  int i;
  const int n = LENGTH(x_);
  int *x = INTEGER(x_);
  int *y = INTEGER(y_);
  int sumprod = 0;
  
  for (i=0; i<n; i++)
    sumprod += x[i]*y[i];
  
  PROTECT(ret = allocVector(INTSXP, 1));
  INTEGER(ret)[0] = sumprod;
  UNPROTECT(1);
  return ret;
}

