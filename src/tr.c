#include <R.h>
#include <Rinternals.h>

SEXP R_tr_real(SEXP x_)
{
  SEXP ret;
  int i;
  const int m = nrows(x_);
  const int n = ncols(x_);
  const int k = m<n?m:n;
  double *x = REAL(x_);
  double trace = 0.;
  
  for (i=0; i<k; i++)
    trace += x[i + i*m];
  
  PROTECT(ret = allocVector(REALSXP, 1));
  REAL(ret)[0] = trace;
  UNPROTECT(1);
  return ret;
}



SEXP R_tr_int(SEXP x_)
{
  SEXP ret;
  int i;
  const int m = nrows(x_);
  const int n = ncols(x_);
  const int k = m<n?m:n;
  int *x = INTEGER(x_);
  int trace = 0;
  
  for (i=0; i<k; i++)
    trace += x[i + i*m];
  
  PROTECT(ret = allocVector(INTSXP, 1));
  INTEGER(ret)[0] = trace;
  UNPROTECT(1);
  return ret;
}



SEXP R_tr(SEXP x)
{
  switch(TYPEOF(x)) {
    case REALSXP: {
      return R_tr_real(x);
    }
    case INTSXP: {
      return R_tr_int(x);
    }
    default: {
      Rf_error("argument 'x' must be numeric");
    }
  }
  return R_NilValue;
}
