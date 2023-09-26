x_curr <- d.x_update(x_prev, A, b,
              u_prev, rho, z_prev)

z_curr <- S_z(rowMeans(emerge(x_curr)) +
              rowMeans(emerge(u_curr)))
u_curr <- u_prev + x_curr - z_curr
