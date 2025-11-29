import numpy as np
import matplotlib.pyplot as plt
import math

X_0 = 0.7
dt = 2**(-10)
nt = int(1./dt)
trials = 10**5

mu = 0 
t = np.zeros(nt+1)
X_sde = np.zeros(nt+1)
weight = np.zeros(nt+1)

fig, ax = plt.subplots()

def phi(x,t):
    return 0.5*((x-t)**2 + 2*(x-t) - 1)
def BC(x,t):
    return np.exp(-(x - t)**2/2)

for j in range(trials):
    dW = np.random.normal(0,np.sqrt(dt),size=nt)

    t[0] = 0 
    X_sde[0] = X_0
    weight[0] = 1

    for i in range(nt):
        counter = i
        t[i+1] = t[i] + dt
        X_sde[i+1] = X_sde[i] + dW[i]
        weight[i+1] = weight[i]*np.exp(-phi(X_sde[i],t[i])*dt)
        if (weight[i+1] == 0):
            print('Loop Index: (i, j) = (',i,',',j,')')
            print('Diagnostic: ',t[i+1],X_sde[i+1],weight[i+1])
            break
    mu_update = weight[-1]*BC(X_sde[-1],1)
    mu += mu_update
        
mu /= trials
print('Average Value: ', mu)
