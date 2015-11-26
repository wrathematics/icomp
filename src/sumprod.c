#include <R.h>
#include <Rinternals.h>

static SEXP R_sumprod_real(SEXP x_, SEXP y_)
{
  SEXP ret;
  const int n = LENGTH(x_);
  double *x = REAL(x_);
  double *y = REAL(y_);
  double sumprod = 0.;
  
  for (unsigned int i=0; i<n; i++)
    sumprod += x[i]*y[i];
  
  PROTECT(ret = allocVector(REALSXP, 1));
  REAL(ret)[0] = sumprod;
  UNPROTECT(1);
  return ret;
}



static SEXP R_sumprod_int(SEXP x_, SEXP y_)
{
  SEXP ret;
  const int n = LENGTH(x_);
  int *x = INTEGER(x_);
  int *y = INTEGER(y_);
  int sumprod = 0;
  
  for (unsigned int i=0; i<n; i++)
    sumprod += x[i]*y[i];
  
  PROTECT(ret = allocVector(INTSXP, 1));
  INTEGER(ret)[0] = sumprod;
  UNPROTECT(1);
  return ret;
}



SEXP R_sumprod(SEXP x, SEXP y)
{
  if (LENGTH(x) != LENGTH(y))
    Rf_error("arguments 'x' and 'y' must be vectors of the same length");
  
  if (isReal(x))
  {
    if (isInteger(y))
    {
      y = PROTECT(coerceVector(y, REALSXP));
      UNPROTECT(1);
    }
    
    return R_sumprod_real(x, y);
  }
  else if (isReal(y))
  {
    x = PROTECT(coerceVector(x, REALSXP));
    UNPROTECT(1);
    
    return R_sumprod_real(x, y);
  }
  else
    return R_sumprod_int(x, y);
}


