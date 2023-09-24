y <- f(x)	# dist, no wait
f(i)		# local
z <- f(y)	# dist, no wait
f(j)		# local
f(z)		# dist, wait
