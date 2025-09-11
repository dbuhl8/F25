import matplotlib.pyplot as plt
import numpy as np
import pyvista as pv
import dbuhlMod as db
from netCDF4 import MFDataset
from pyvista import examples

# pyvista tutorial for a volumetric data plots with opacity
#grid = examples.load_hydrogen_orbital(3,2,-2)
#grid.plot(volume=True, opacity=[1,0,1],cmap='magma')

fn = 'simdat2.cdf'
cdf_file = MFDataset(fn)

x = np.array(cdf_file.variables["x"])
y = np.array(cdf_file.variables["y"])
z = np.array(cdf_file.variables["z"])
t = np.array(cdf_file.variables["t"][:])
Nx = len(x)
Ny = len(y)
Nz = len(z)
Nt = len(t)
gx = cdf_file.variables["Gammax"][0]
gy = cdf_file.variables["Gammay"][0]
gz = cdf_file.variables["Gammaz"][0]
dx = gx/Nx
dy = gy/Ny
dz = gz/Nz

ux =  np.array(cdf_file.variables["ux"][:])
uy =  np.array(cdf_file.variables["uy"][:])

vortz = db.FD6X(uy,Nx,dx) - db.FD6Y(ux,Ny,dy)
vortz = np.transpose(vortz, axes=(0,3,2,1))
vortz_max = 2*np.abs(ux).max()

opacity = [.6, .3, 0, .3, .6]
tf = pv.opacity_transfer_function(opacity, 256).astype(float) / 255.0
ptstp = -1
pl = pv.Plotter(border=False)
pl.add_volume(vortz[ptstp,:,:,:],clim=[-vortz_max,vortz_max],cmap='RdYlBu_r',opacity=opacity)
pl.show()

