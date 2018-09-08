import numpy as np
import matplotlib
from matplotlib import pyplot as plt
import glob


data = sorted(glob.glob('data_*'))

#NOTE if dx is changed in hydr.f90 dt must be changed in hyd.py
dt=.0005


i=0
for d in data:
    if(i<10000):
        data = np.genfromtxt(fname=d)
        x=data[:,0]
        u=data[:,1]
        plt.plot(x,u)
        plt.xlim(0,1)
        plt.ylim(0,1.1)
        j = str(i)
        k=i*dt
        plt.title('Plot of advection equation at t={0:.3f}'.format(k))
        plt.xlabel('x')
        plt.ylabel('u')
        plt.savefig('plot_'+j.zfill(4)+'.png')
        i = i + 1
        plt.close()







