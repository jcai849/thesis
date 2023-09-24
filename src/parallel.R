cl <- makeCluster(2)
doParallel::registerDoParallel(cl)
x <- 10
foreach(i=1:5) %dopar% {x <- x+1}
