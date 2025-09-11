import matplotlib.pyplot as plt
import numpy as np
import pyvista as pv
import dbuhlMod as db
from netCDF4 import MFDataset

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
del x
del y
del z
gx = cdf_file.variables["Gammax"][0]
gy = cdf_file.variables["Gammay"][0]
gz = cdf_file.variables["Gammaz"][0]
dx = gx/Nx
dy = gy/Ny
dz = gz/Nz

ptstp = -1
ux =  np.array(cdf_file.variables["ux"][:])
ux_inst =  ux[ptstp,:,:,:]
del ux
uy =  np.array(cdf_file.variables["uy"][:])
uy_inst =  uy[ptstp,:,:,:]
del uy


vortz_max = 2*np.abs(ux_inst).max()
vortz = db.iFD6X(uy_inst,Nx,dx) - db.iFD6Y(ux_inst,Ny,dy)
vortz = np.transpose(vortz, axes=(2,1,0))

opacity = [.3, 0, 0, 0, .3]
tf = pv.opacity_transfer_function(opacity, 256).astype(float) / 255.0
pl = pv.Plotter(border=False)
pl.add_volume(vortz,clim=[-vortz_max,vortz_max],cmap='RdYlBu_r',opacity=opacity)
pl.add_bounding_box()
pl.show()

