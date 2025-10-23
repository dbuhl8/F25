import numpy as np
import matplotlib.pyplot as plt
import math

dt = 2**-10
tf = 1
nt = math.ceil(tf/dt)

t = np.linspace(0,tf,nt,endpoint=True)

fig, ax = plt.subplots(4,1,sharex=True)

for j in range(3):
    fda = np.zeros(nt)
    fdb = np.zeros_like(fda)
    dw = np.sqrt(dt)*np.random.normal(0,1,nt-1)
    for i in range(nt-1):
        t[i+1] = t[i] + dt
        fda[i+1] = fda[i] + np.sqrt(np.sin(fda[i])**2 + 1)*dw[i] + \
            (np.cos(fda[i]) + 1)*dw[i]**2
        fdb[i+1] = fdb[i] + np.sqrt(np.sin(fdb[i])**2 + 1)*dw[i] + \
            (np.cos(fdb[i]) + 1)*dt
    ax[j].plot(t,fda,'r',t,fdb,'b')
    ax[j].legend(['FDA','FDB'])
    title_str = f'Trial {j+1}'
    ax[j].set_title(title_str)
    ax[3].semilogy(t,np.abs(fdb-fda),label=f'Trial {j+1}')

ax[3].legend()
#plt.show()
fig.tight_layout()
plt.savefig('prob7_pb.png',dpi=800)



dt = 2**-16
tf = 1
nt = math.ceil(tf/dt)
t = np.linspace(0,tf,nt,endpoint=True)
fig, ax = plt.subplots(4,1,sharex=True)

for j in range(3):
    fda = np.zeros(nt)
    fdb = np.zeros_like(fda)
    dw = np.sqrt(dt)*np.random.normal(0,1,nt-1)
    for i in range(nt-1):
        t[i+1] = t[i] + dt
        fda[i+1] = fda[i] + np.sqrt(np.sin(fda[i])**2 + 1)*dw[i] + \
            (np.cos(fda[i]) + 1)*dw[i]**2
        fdb[i+1] = fdb[i] + np.sqrt(np.sin(fdb[i])**2 + 1)*dw[i] + \
            (np.cos(fdb[i]) + 1)*dt
    ax[j].plot(t,fda,'r',t,fdb,'b')
    ax[j].legend(['FDA','FDB'])
    title_str = f'Trial {j+1}'
    ax[j].set_title(title_str)
    ax[3].semilogy(t,np.abs(fdb-fda),label=f'Trial {j+1}')

ax[3].legend()
#plt.show()
fig.tight_layout()
plt.savefig('prob7_pc.png',dpi=800)


    
