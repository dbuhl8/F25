import numpy as np
import matplotlib.pyplot as plt

mu = 0.6
sigma = 1.3
nx = 10
nr = 500000

mle_mse_error = 0
sample_mse_error = 0
mle_me_error = 0
sample_me_error = 0


for i in range(nr):
    x = np.random.normal(mu,sigma,nx)
    mle_mu = x.mean()
    mle_sigma = np.sum((x-mle_mu)**2)/nx
    sample_sigma = np.sum((x-mle_mu)**2)/(nx-1)
    mle_mse_error += (mle_sigma**2 - sigma**2)**2
    sample_mse_error += (sample_sigma**2 - sigma**2)**2
    mle_me_error += mle_sigma**2 - sigma**2
    sample_me_error += sample_sigma**2 - sigma**2

mle_mse_error /= nr
sample_mse_error /= nr
mle_me_error /= nr
sample_me_error /= nr

print('MLE MSE Error: ', mle_mse_error)
print('Sample MSE Error: ', sample_mse_error)
print('MLE ME Error: ', mle_me_error)
print('Sample ME Error: ', sample_me_error)
