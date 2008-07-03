`ICOMPr.lm` <-
function(lm.model) {

  lLik		<- logLik(lm.model)
  X.mat		<- model.matrix(lm.model)
  inv.matrix	<- solve(t(X.mat)%*%X.mat)
  cov.matrix	<- summary(lm.model)$sigma^2*inv.matrix
  cov.val	<- diag(diag(1/cov.matrix))
  r.matrix	<- sqrt(cov.val)%*%cov.matrix%*%sqrt(cov.val)
  k		<- dim(inv.matrix)[1]+1
  icompr.val	<- -2*lLik + 2*(k/2*log(sum(diag(r.matrix)/k)) - 1/2*log(det(r.matrix)))

  return(icompr.val[1])

}

