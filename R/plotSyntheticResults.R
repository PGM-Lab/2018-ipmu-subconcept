######################################################################
## author:        Rafael Cabañas (rcabanas@decsai.ugr.es)
## date:          8th September 2017
## description:   Plot results for concept drift detection with the
##                synthetic data (Section 4.1, Fig. 6)
######################################################################
rm(list=ls())
library(tikzDevice)
setwd(dirname(sys.frame(1)$ofile))


### data ###

H1 <- c(0.8666277325015065, 0.867815539819874, 0.9856979747480592, 1.0034860573662767, 0.9575645252049952, 0.9612245404232355, 0.6209454951020758, 0.6144107354701758, 1.0540697483781056, 1.0427498183076767, 1.0569378713600468, 1.058591672205049)
H2 <- c(-0.30412610433382353, -0.307061743058144, -0.3051713150914682, -0.3055786606185799, -0.25853019048166387, -0.2577368203415103, -0.27195969282665144, -0.27475375006213415, -0.3900938722902143, -0.38909086937634335, -0.3892785967760656, -0.38982662031153786)


### plotting style parameters ####
col2 = c( "#e41a1c", "#2b83ba")
type2 = c("l", "l", "l")
lty2 = c(2,1)
lwd2 = c(2,2)

### Saves plot into a .tex file #######

tikz('img/resSynthetic.tex', standAlone = TRUE, width = 7.5, height = 4.5) 


plot( H1, pch=19, type='l',lty=lty2[1], col=col2[1]
  , xlab='time-step'
  , ylab=' '
  , ylim=c(-0.5,1.5)
  ,lwd=lwd2[1]
  ,xaxt = "n"
)

axis(1, at=1:12)


lines( seq(1,length(H2)), H2, pch=6, type='l', col=col2[2], lty=lty2[2],lwd=lwd2[2])
grid()

legend('topright', c('$H1^t$', '$H2^t$'), col=col2, lty=lty2, lwd=lwd2, horiz = TRUE)
dev.off()