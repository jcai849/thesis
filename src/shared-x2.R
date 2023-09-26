                     u_prev, rho, z_prev) {
                optim(x_prev, function(x_prev)
                        (1/2)*l2_norm(A %*% x_prev - b)^2 +
                        (rho/2)*l2_norm(x_prev - z_prev + u_prev)^2)$par
