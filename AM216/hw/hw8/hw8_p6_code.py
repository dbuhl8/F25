import numpy as np
import matplotlib.pyplot as plt
import math


# problem 6 diagnostics

sigma = 1
dt = 1e-2
nt = int(1/dt)


X_0 = 1

t = np.zeros(nt+1)
X_sde = np.zeros(nt+1)
X_int = np.zeros(nt+1)

trials = 1000
mu_sde = 0
mu_int = 0

fig, ax = plt.subplots(2,1)

for j in range(trials):
    dW = np.random.normal(0,np.sqrt(dt),size=nt)

    t[0] = 0 
    X_sde[0] = X_0
    X_int[0] = X_0

    for i in range(nt):
        t[i+1] = t[i] + dt
        X_sde[i+1] = X_sde[i] + sigma*X_sde[i]*dW[i]
        X_int[i+1] = X_int[i]*np.exp(sigma*dW[i])

    mu_sde += X_sde[-1]
    mu_int += X_int[-1]
   
    if (j < 10):
        ax[0].plot(t,X_sde,'--b')
        ax[0].plot(t,X_int,'--r')
        ax[1].plot(t,np.log(X_sde),'--b')
        ax[1].plot(t,np.log(X_int),'--r')

print('MU_sde: ', mu_sde/trials,', MU_int: ', mu_int/trials,', MU_me: ', X_0*np.exp((sigma**2*t[-1])/2))

mu = X_0*np.exp((sigma**2*t)/2)
ax[0].plot(t,mu,'g')
ax[0].set_title('Evolution of X')
ax[1].plot(t,np.log(mu),'g')
ax[1].set_title('Evolution of Y')
plt.show()
