import numpy as np
import matplotlib.pyplot as plt
import math

plt.rcParams['text.usetex'] = True

def rk4(state,t,dt,eps,func):
    # state vector will contain x,dx/dt=y,d2x/dt2=z
    k1 = func(t, state, eps)
    k2 = func(t+dt/2, state + dt*k1/2, eps)
    k3 = func(t+dt/2, state + dt*k2/2, eps)
    k4 = func(t+dt, state + dt*k3, eps)
    return state + (dt/6)*(k1+k2+k3+k4)

def ode1(t,state, eps):
    dy = np.zeros_like(state)
    dy[0] = state[1]
    dy[1] = -t*(t*state[0] + state[1])/eps
    return dy

eps_array = [0.3,0.1,0.01,0.001]

fig, ax = plt.subplots()

for i in range(2):
    eps = eps_array[i]
    print('eps = {:.4f}'.format(eps))
    dt = 1e-4
    tspan = 2 
    nt = math.ceil(tspan/dt)
    y = np.zeros((nt+1,2))
    ye = 2
    t = np.zeros(nt+1)
    err = 100
    # shooting method (to find solution) 
    counter = 0

    y0 = -1
    t[0] = -1
    y[0,:] = [1,y0] # setting IC
    for j in range(nt):
        t[j+1] = t[j] + dt
        y[j+1,:] = rk4(y[j,:],t[j],dt,eps,ode1)
    #print('Y: ', y[:,0])
    err = y[nt,0]-ye 
    pe1 = err
    py1 = y0

    y0 = 0
    t[0] = -1
    y[0,:] = [1,y0] # setting IC
    for j in range(nt):
        t[j+1] = t[j] + dt
        y[j+1,:] = rk4(y[j,:],t[j],dt,eps,ode1)
    #print('Y: ', y[:,0])
    #print('t: ', t)
    err = y[nt,0]-ye 
    pe2 = err
    py2 = y0


    de = pe2 - pe1
    dy = py2 - py1

    #print('py1: ', py1, ', py2: ', py2, ', dy: ', dy)
    #print('pe1: ', pe1, ', pe2: ', pe2, ', de: ', de)

    while (np.abs(err) > 1e-4 and counter < 20):
        #print('Before Update ydot = {:.4f}'.format(y0))
        y0 -= pe2*de/dy
        #print(r'After Update ydot = {:.4f}'.format(y0))
        t[:] = 0
        y[:,:] = 0
        t[0] = -1
        y[0,:] = [1,y0] # setting IC

        for j in range(nt):
            t[j+1] = t[j] + dt
            y[j+1,:] = rk4(y[j,:],t[j],dt,eps,ode1)
        err = y[nt,0]-ye 
        #print('error = {:.4f}'.format(err))
        pe1 = pe2
        pe2 = err
        py1 = py2
        py2 = y0
        de = pe2-pe1
        dy = py2-py1
        counter += 1
    print('Counter: ',counter)
        
    ax.plot(t,y[:,0],label=r'$\varepsilon = {:.4f}$'.format(eps))

ax.legend()
plt.show()

