import numpy as np
import matplotlib.pyplot as plt
import math


# problem 6 diagnostics

sigma = 1
dt = 1e-2
nt = int(1e2)


X_0 = 1

t = np.zeros(nt)
X_sde = np.zeros(nt)
X_int = np.zeros(nt)

trials = 20

fig, ax = plt.subplots()

for j in range(trials):
    dW = np.random.normal(0,dt,size=nt-1)

    t[0] = 0 
    X_sde[0] = X_0
    X_int[0] = X_0

    for i in range(nt-1):
        t[i+1] = t[i] + dt
        X_sde[i+1] = X_sde[i] + sigma*X_sde[i]*dW[i]
        X_int[i+1] = X_0*np.exp(sigma*np.sum(dW[:i+1]))
    
    ax.plot(t,X_sde,'--b')
    ax.plot(t,X_int,'r')

mu = X_0*np.exp((sigma**2*t)/2)
ax.plot(t,mu,'g')
plt.show()
