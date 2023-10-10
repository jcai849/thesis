nc <- 15
cs <- split(taxicab, cumsum((seq(nrow(taxicab)) - 1) %% nc == 0)) # split to chunks
model <- Reduce(f = update, x = cs[-1],
		init = biglm(Tip_amount ~ Passenger_count * Fare_amount, cs[[1]]))
