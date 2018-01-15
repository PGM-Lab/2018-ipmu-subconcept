######################################################################
## author:        Rafael Cabañas (rcabanas@decsai.ugr.es)
## date:          15th January 2018
## description:   Plot results for concept drift detection with the
##                synthetic data 
######################################################################
rm(list=ls())
library(tikzDevice)
setwd(dirname(sys.frame(1)$ofile))


### data ###

H1 <- c(0.8666277325015065, 0.867815539819874, 0.9856979747480592, 1.0034860573662767, 0.9575645252049952, 0.9612245404232355, 0.6209454951020758, 0.6144107354701758, 1.0540697483781056, 1.0427498183076767, 1.0569378713600468, 1.058591672205049)
H2 <- c(-0.30412610433382353, -0.307061743058144, -0.3051713150914682, -0.3055786606185799, -0.25853019048166387, -0.2577368203415103, -0.27195969282665144, -0.27475375006213415, -0.3900938722902143, -0.38909086937634335, -0.3892785967760656, -0.38982662031153786)
Hglobal <- c(0.38502762905663, 0.38766531214220995, 0.35942562251339727, 0.3557446423858058, 0.3591343315511317, 0.36015157481648846, 0.39031836909084217, 0.3967348806123451, 0.36007028201436375, 0.3640441375239352, 0.3656018900741301, 0.3636332297594926)


### plotting style parameters ####
col3 = c( "#e41a1c", "#2b83ba", "#000000")
type3 = c("l", "l", "l")
lty3 = c(3,2,1)
lwd3 = c(4,3,2)

### Saves plot into a .tex file #######

tikz('img/resSynthetic.tex', standAlone = TRUE, width = 7.5, height = 4.5) 


plot( H1, pch=19, type='l',lty=lty3[1], col=col3[1]
  , xlab='time-step'
  , ylab=' '
  , ylim=c(-0.5,1.5)
  ,lwd=lwd3[1]
  ,xaxt = "n"
)

axis(1, at=1:12)


lines( seq(1,length(H2)), H2, pch=6, type='l', col=col3[2], lty=lty3[2],lwd=lwd3[2])
lines( seq(1,length(Hglobal)), Hglobal, pch=6, type='l', col=col3[3], lty=lty3[3],lwd=lwd3[3])



grid()

legend('topright', c('$H1^t$', '$H2^t$', '$H^t$'), col=col3, lty=lty3, lwd=lwd3, horiz = TRUE)
dev.off()