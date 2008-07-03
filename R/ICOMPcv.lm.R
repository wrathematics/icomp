`ICOMPcv.lm` <-
function(lm.model) {

  lLik		<- logLik(lm.model)
  coef		<- lm.model$coefficients
  coef.mat	<- diag(1/coef)
  X.mat		<- model.matrix(lm.model)
  inv.matrix	<- solve(t(X.mat)%*%X.mat)
  cov.matrix	<- summary(lm.model)$sigma^2*inv.matrix
  cv.matrix	<- coef.mat%*%cov.matrix%*%coef.mat
  k		<- dim(inv.matrix)[1]+1
  icomp.val	<- -2*lLik + 2*(k/2*log(sum(diag(cv.matrix)/k)) - 1/2*log(det(cv.matrix)))

  return(icomp.val[1])

}

