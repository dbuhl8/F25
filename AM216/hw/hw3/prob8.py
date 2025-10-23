import numpy as np
import math
import matplotlib.pyplot as plt

fig, ax = plt.subplots()

tf = 1

for j in range(9):
    dt = 2**(-(j+2))
    print(f'DT: {dt}')
    nt = math.ceil(tf/dt)
    print(f'NT: {nt}')

    t = np.linspace(0,tf,nt+1,endpoint=True)
    fdb = np.zeros_like(t)
    if j == 0:
        dw = np.sqrt(dt)*np.random.normal(0,1,nt)
    else: 
        dw = np.zeros(nt) 
        for i in range(nt):
            #print(f'Old Nt: {len(old_dw)}, New Nt: {len(dw)}')
            if np.mod(i,2) == 0:
                dw[i] = 0.5*old_dw[int(i/2)] + np.sqrt(dt/2)*\
                    np.random.normal(0,1)
            else: 
                dw[i] = old_dw[int((i-1)/2)] - dw[i-1]

    for i in range(nt):
        t[i+1] = t[i] + dt
        fdb[i+1] = fdb[i] + np.sqrt(np.sin(fdb[i])**2 + 1)*dw[i] + \
            (np.cos(fdb[i]) + 1)*dt
    if (np.mod(j,4) == 0):
        ax.plot(t,fdb,label=f'dt=10^-{j+2}')

    old_dw = dw

ax.legend()
#plt.show()
fig.tight_layout()
plt.savefig('prob8.png',dpi=800)
