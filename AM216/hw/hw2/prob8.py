import math
import numpy as np
import matplotlib.pyplot as plt

dt = 2.**(-10)
nt = math.ceil(1./dt)

t = np.arange(0,1,dt)
y_true = np.exp(t)
print('Number of loops: ', nt)
print('Size of t matrix: ', np.size(t))

y_fd1 = np.zeros(np.size(t))
y_fd2 = np.zeros(np.size(t))
y_fd3 = np.zeros(np.size(t))

y_fd1[0] = 1
y_fd2[0] = 1
y_fd3[0] = 1

for i in range(nt-1):
    eps = np.random.normal(0,1)
    y_fd1[i+1] = y_fd1[i] + y_fd1[i]*dt
    y_fd2[i+1] = y_fd2[i] + y_fd2[i]*dt + 0.5*y_fd2[i]*dt**2
    y_fd3[i+1] = y_fd3[i] + y_fd3[i]*dt*(1+eps)

fig, ax = plt.subplots()

ax.plot(t, y_fd1, t, y_fd2, t, y_fd3, t, y_true)
ax.legend(['FD1', 'FD2', 'FD3', 'True'])

plt.savefig('prob8_parta.png',dpi=800)

fig, ax = plt.subplots()

ax.semilogy(t, np.abs(y_fd1 - y_true),\
    t, np.abs(y_fd2 - y_true), \
    t, np.abs(y_fd3 - y_true))

ax.legend(['FD1', 'FD2', 'FD3'])
plt.savefig('prob8_partb.png',dpi=800)

dt = 2.**(-16)

t = np.arange(0,1,dt,dtype=np.float64)
y_true = np.exp(t)

y_fd1 = np.zeros(np.size(t),dtype=np.float64)
y_fd2 = np.zeros(np.size(t),dtype=np.float64)
y_fd3 = np.zeros(np.size(t),dtype=np.float64)

y_fd1[0] = 1
y_fd2[0] = 1
y_fd3[0] = 1

for i in range(nt-1):
    eps = np.random.normal(0,1)
    y_fd1[i+1] = y_fd1[i] + y_fd1[i]*dt
    y_fd2[i+1] = y_fd2[i] + y_fd2[i]*dt + 0.5*y_fd2[i]*dt**2
    y_fd3[i+1] = y_fd3[i] + y_fd3[i]*dt*(1+eps)

fig, ax = plt.subplots()

ax.semilogy(t, np.abs(y_fd1 - y_true),\
    t, np.abs(y_fd2 - y_true), \
    t, np.abs(y_fd3 - y_true))

ax.legend(['FD1', 'FD2', 'FD3'])

plt.savefig('prob8_partc.png',dpi=800)

