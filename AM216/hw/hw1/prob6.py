import matplotlib.pyplot as plt
import numpy as np



mu = 0.6
sigma = 1.3

nr = 500000
nx = 10

act_in_95 = 0
est_in_95 = 0

for i in range(nr):
    x = np.random.normal(mu, sigma, nx)
    est_mu = x.mean()
    est_sigma = np.sqrt(np.sum((x-est_mu)**2)/(nx-1))
    if (abs(mu-est_mu) <= 2*sigma):
        act_in_95 += 1
    if (abs(mu-est_mu) <= 2*est_sigma):
        est_in_95 += 1

print('Fraction of time mean is in 95% confidence interval (actual sigma): ',\
    act_in_95/nr)
print('Fraction of time mean is in 95% confidence interval (estim. sigma): ',\
    est_in_95/nr)


