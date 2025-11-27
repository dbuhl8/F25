import numpy as np
import matplotlib.pyplot as plt
import math


# problem 6 diagnostics

sigma = 1
dt = 2**(-10)
nt = int(1./dt)


X_0 = 0.7

t = np.zeros(nt)
X_sde = np.zeros(nt)
weight = np.zeros(nt)

trials = 10**5

fig, ax = plt.subplots()

mu = 0 

def phi(x,t):
    return 0.5*((x-t)**2 + 2*(x-t) - 1)
def BC(x,t):
    return np.exp(-(x - t)**2/2)

for j in range(trials):
    dW = np.random.normal(0,dt,size=nt-1)

    t[0] = 0 
    X_sde[0] = X_0
    weight[0] = 1
    phi

    for i in range(nt-1):
        t[i+1] = t[i] + dt
        X_sde[i+1] = X_sde[i] + dW[i]
        weight[i+1] = weight[i]*np.exp(phi(X_sde[i],t[i]))*dt
    mu += weight[-1]*BC(X_sde[-1],1)
        
mu /= trials
print('Average Value: ', mu)
