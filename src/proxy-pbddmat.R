library(pbdDMAT, quiet = TRUE)
init.grid()

x <- matrix(1:9, 3)
x <- as.ddmatrix(x)

y <- sqrt(abs(log(x/10)))
comm.print(y)

finalize()
