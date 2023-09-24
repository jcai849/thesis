        library(pbdDMAT, quiet = TRUE)
        init.grid()
        
        x <- ddmatrix(1:9, 3, bldim=2)
        
        y <- list(dim=dim(x), ldim=ldim(x))
        comm.print(y)
        
        finalize()
