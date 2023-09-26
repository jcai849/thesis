x_curr <- mapply(x.update, x_prev,
                     A, b, u_prev,
     MoreArgs = list(rho, z_prev))
z_curr <- S_z(rowMeans(x_curr) +
              rowMeans(u_curr))
u_curr <- mapply(function(u_prev,
                  x_curr, z_curr)
        u_prev + x_curr - z_curr,
                  u_prev, x_curr,
         MoreArgs = list(z_curr))
