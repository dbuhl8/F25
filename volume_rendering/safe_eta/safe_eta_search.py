import numpy as np
import dbuhlMod as db
import os
import fnmatch
from netCDF4 import MFDataset
from netCDF4 import Dataset

Re600_Pe60=['B300Re600Pe60/','B180Re600Pe60/','B100Re600Pe60/','B30Re600Pe60/',\
            'B10Re600Pe60/','B3Re600Pe60/','B1Re600Pe60/']

Re600_Pe60_bounds=[[40,80],[40,90],[45,160],\
    [35,80],[50,250],[55,110],[45,125]]

Re1000_Pe100 = ['B100Re1000Pe100/', 'B10Re1000Pe100/']

Re1000_Pe100_bounds=[[40,70],[70,110]]

simulations = [Re600_Pe60, Re1000_Pe100]

bounds = [Re600_Pe60_bounds, Re1000_Pe100_bounds]

# preparing output file
header_string = "#" + "{:<s}    "*41
tavg_header_string = "#" + "{:<s}    "*42
fmt_str = "{:.4e}    "*41
tavg_fmt_str = "{:.4e}    "*42
# 20 columns
header_string = header_string.format('Re','B','Pr', 'Pe', 'BPe', 't', 'avg_uh',\
    'tdisp', 'mdisp', 'eta (local)', 'eta (global)', \
    'lam tdisp', 'lam mdisp', 'lam eta (local)', 'lam eta (global)', \
    'lam_Fr tdisp', 'lam_Fr mdisp',\
    'lam_Fr eta (local)', 'lam_Fr eta (global)', \
    'lam_Fr_vortz tdisp', 'lam_Fr_vortz mdisp',\
    'lam_Fr_vortz eta (local)', 'lam_Fr_vortz eta (global)', \
    'turb tdisp', 'turb mdisp', 'turb eta (local)', 'turb eta (global)', \
    'turb_Fr tdisp', 'turb_Fr mdisp',\
    'turb_Fr eta (local)', 'turb_Fr eta (global)', \
    'turb_Fr_vortz tdisp', 'turb_Fr_vortz mdisp',\
    'turb_Fr_vortz eta (local)', 'turb_Fr_vortz eta (global)', \
    'vlam', 'vturb',\
    'vlam_Fr', 'vturb_Fr',\
    'vlam_Fr_vortz', 'vturb_Fr_vortz')
tavg_header_string = tavg_header_string.format('Re','B','Pr', 'Pe', 'BPe',\
    'lb','ub','avg_uh','tdisp', 'mdisp', 'eta (local)', 'eta (global)', \
    'lam tdisp', 'lam mdisp', 'lam eta (local)', 'lam eta (global)', \
    'lam_Fr tdisp', 'lam_Fr mdisp',\
    'lam_Fr eta (local)', 'lam_Fr eta (global)', \
    'lam_Fr_vortz tdisp', 'lam_Fr_vortz mdisp',\
    'lam_Fr_vortz eta (local)', 'lam_Fr_vortz eta (global)', \
    'turb tdisp', 'turb mdisp', 'turb eta (local)', 'turb eta (global)', \
    'turb_Fr tdisp', 'turb_Fr mdisp',\
    'turb_Fr eta (local)', 'turb_Fr eta (global)', \
    'turb_Fr_vortz tdisp', 'turb_Fr_vortz mdisp',\
    'turb_Fr_vortz eta (local)', 'turb_Fr_vortz eta (global)', \
    'vlam', 'vturb',\
    'vlam_Fr', 'vturb_Fr',\
    'vlam_Fr_vortz', 'vturb_Fr_vortz')

io_file = open('safe_nonrotating_stoch_eta.dat','w')
tavg_file = open('stoch_tavg_eta.dat','w')
io_file.write(header_string)
tavg_file.write(tavg_header_string)
io_file.write('\n')
tavg_file.write('\n')

index_counter = 0


for m, sim_set in enumerate(simulations):
    # loops over each parameter set (i.e. Re = 600, Pe = 60 is one iteration of
    # the loop)
    for n, dir_path in enumerate(sim_set):
        # loops over each B value in that parameter suite
        # the following 3 lines finds the file path of each individual simdat
        # file
        directory = os.listdir(dir_path)
        simdat_files = fnmatch.filter(directory,'simdat*.cdf')
        simdat_files = [dir_path+x for x in simdat_files]
        B = 0
        Re = 0
        Pe = 0
        t_tot = np.array([])
        avg_uh = np.array([])

        avg_tdisp = np.array([])
        avg_lam_tdisp = np.array([])
        avg_lam_Fr_tdisp = np.array([])
        avg_lam_Fr_vortz_tdisp = np.array([])
        avg_turb_tdisp = np.array([])
        avg_turb_Fr_tdisp = np.array([])
        avg_turb_Fr_vortz_tdisp = np.array([])

        avg_mdisp = np.array([])
        avg_lam_mdisp = np.array([])
        avg_lam_Fr_mdisp = np.array([])
        avg_lam_Fr_vortz_mdisp = np.array([])
        avg_turb_mdisp = np.array([])
        avg_turb_Fr_mdisp = np.array([])
        avg_turb_Fr_vortz_mdisp = np.array([])

        avg_local_eta = np.array([])
        avg_local_lam_eta = np.array([])
        avg_local_lam_Fr_eta = np.array([])
        avg_local_lam_Fr_vortz_eta = np.array([])
        avg_local_turb_eta = np.array([])  
        avg_local_turb_Fr_eta = np.array([])  
        avg_local_turb_Fr_vortz_eta = np.array([])  

        avg_global_eta = np.array([])
        avg_global_lam_eta = np.array([]) 
        avg_global_lam_Fr_eta = np.array([]) 
        avg_global_lam_Fr_vortz_eta = np.array([]) 
        avg_global_turb_eta = np.array([])
        avg_global_turb_Fr_eta = np.array([])
        avg_global_turb_Fr_vortz_eta = np.array([])

        vturb = np.array([])
        vturb_Fr = np.array([])
        vturb_Fr_vortz = np.array([])

        vlam = np.array([])
        vlam_Fr = np.array([])
        vlam_Fr_vortz = np.array([])
        

        for j, fn in enumerate(simdat_files):
            # inject extraction routine here
            cdf_file = Dataset(fn,exclude='Chem')

            x = np.array(cdf_file.variables["x"])
            y = np.array(cdf_file.variables["y"])
            z = np.array(cdf_file.variables["z"])
            t = np.array(cdf_file.variables["t"])
            Nx = len(x)
            Ny = len(y)
            Nz = len(z)
            np_tot = Nx*Ny*Nz
            Nt = len(t)
            print('Number of Timesteps: ', Nt)
            del x
            del y
            del z
            gx = cdf_file.variables["Gammax"][0]
            gy = cdf_file.variables["Gammay"][0]
            gz = cdf_file.variables["Gammaz"][0]
            dx = gx/Nx
            dy = gy/Ny
            dz = gz/Nz
            Re = 1./cdf_file.variables["D_visc"][0]
            Pe = 1./cdf_file.variables["D_therm"][0]
            B = cdf_file.variables["B_therm"][0]
            Fr = 1./np.sqrt(B)
            print("Parameters: Re - ", Re, ", Pe - ", Pe, ', B - ', B)

            ux = np.array(cdf_file.variables["ux"])
            uy = np.array(cdf_file.variables["uy"])
            uz = np.array(cdf_file.variables["uz"])
            temp = np.array(cdf_file.variables["Temp"])

            cdf_file.close()

            #dTdz = db.FD6Z(temp_inst,Nz,dz)
            tdisp = db.FD6Z(temp,Nz,dz)**2 + db.FD6Y(temp,Ny,dy)**2 +\
                db.FD6X(temp,Nx,dx)**2
            del temp

            mdisp = db.FD6Z(ux,Nz,dz)**2 + db.FD6Y(ux,Ny,dy)**2 +\
                db.FD6X(ux,Nx,dx)**2 + db.FD6Z(uy,Nz,dz)**2 +\
                db.FD6Y(uy,Ny,dy)**2 + db.FD6X(uy,Nx,dx)**2 +\
                db.FD6Z(uz,Nz,dz)**2 + db.FD6Y(uz,Ny,dy)**2 +\
                db.FD6X(uz,Nx,dx)**2
            #Ri = (1 + dTdz)/((Fr**2)*np.minimum((db.iFD6Z(ux_inst,Nz,dz)**2 +\
            #   db.iFD6Z(uy_inst,Nz,dz)**2),1e-4)) 
            eta = (B*tdisp/Pe)/(B*tdisp/Pe + mdisp/Re)
            vortz = db.FD6X(uy,Nx,dx) - db.FD6Y(ux,Ny,dy)
            uh = (ux**2+uy**2)**0.5
            del ux
            del uy
            del uz

            for i in range(Nt):

                # recording timestep and average uh
                t_tot = np.append(t_tot, t[i])
                avg_uh = np.append(avg_uh,uh[i,:,:,:].mean())

                # eta = (thermal dissipation) / (total energy dissipation)
                # eta = pf1*tdisp / (pf1*tdisp + pf2*mdisp)

                # identifying turbulent and laminar regions
                # raw metric
                idx_lam = np.where(vortz[i,:,:,:]**2 <= 1./Fr)
                idx_turb = np.where(vortz[i,:,:,:]**2 > 1./Fr)
                # with rescaling to the effective Froude number
                # effective Froude number: Fr_eff = Fr_input * uh_rms
                idx_lam_Fr = np.where(vortz[i,:,:,:]**2<=1./(Fr*avg_uh[-1]))
                idx_turb_Fr = np.where(vortz[i,:,:,:]**2>1./(Fr*avg_uh[-1]))
                # with rescaling to the effective Froude and vortz
                # effective vortz: vortz_eff = vortz/uh_rms
                # vortz**2 <= uh/Fr
                idx_lam_Fr_vortz = np.where(vortz[i,:,:,:]**2 <=\
                    avg_uh[-1]/Fr)
                idx_turb_Fr_vortz = np.where(vortz[i,:,:,:]**2 >\
                    avg_uh[-1]/Fr)


                # computing local eta
                avg_local_eta = np.append(avg_local_eta,eta[i,:,:,:].mean())
                avg_local_lam_eta = np.append(avg_local_lam_eta,\
                    eta[i,idx_lam[0],idx_lam[1],idx_lam[2]].mean())
                avg_local_turb_eta = np.append(avg_local_turb_eta,\
                    eta[i,idx_turb[0],idx_turb[1],idx_turb[2]].mean())

                avg_local_lam_Fr_eta = np.append(avg_local_lam_Fr_eta,\
                    eta[i,idx_lam_Fr[0],idx_lam_Fr[1],idx_lam_Fr[2]].mean())
                avg_local_turb_Fr_eta = np.append(avg_local_turb_Fr_eta,\
                    eta[i,idx_turb_Fr[0],idx_turb_Fr[1],idx_turb_Fr[2]].mean())
                avg_local_lam_Fr_vortz_eta = np.append(avg_local_lam_Fr_vortz_eta,\
                    eta[i,idx_lam_Fr_vortz[0],idx_lam_Fr_vortz[1],\
                    idx_lam_Fr_vortz[2]].mean())
                avg_local_turb_Fr_vortz_eta = np.append(avg_local_turb_Fr_vortz_eta,\
                    eta[i,idx_turb_Fr_vortz[0],idx_turb_Fr_vortz[1],\
                    idx_turb_Fr_vortz[2]].mean())

                # computing avg tdisp and mdisp
                avg_tdisp = np.append(avg_tdisp,tdisp[i,:,:,:].mean())
                avg_lam_tdisp = np.append(avg_lam_tdisp,\
                    tdisp[i,idx_lam[0],idx_lam[1],idx_lam[2]].mean())
                avg_turb_tdisp = np.append(avg_turb_tdisp,\
                    tdisp[i,idx_turb[0],idx_turb[1],idx_turb[2]].mean())
                avg_lam_Fr_tdisp = np.append(avg_lam_Fr_tdisp,\
                    tdisp[i,idx_lam_Fr[0],idx_lam_Fr[1],idx_lam_Fr[2]].mean())
                avg_turb_Fr_tdisp = np.append(avg_turb_Fr_tdisp,\
                    tdisp[i,idx_turb_Fr[0],idx_turb_Fr[1],idx_turb_Fr[2]].mean())
                avg_lam_Fr_vortz_tdisp = np.append(avg_lam_Fr_vortz_tdisp,\
                    tdisp[i,idx_lam_Fr_vortz[0],idx_lam_Fr_vortz[1],\
                    idx_lam_Fr_vortz[2]].mean())
                avg_turb_Fr_vortz_tdisp = np.append(avg_turb_Fr_vortz_tdisp,\
                    tdisp[i,idx_turb_Fr_vortz[0],idx_turb_Fr_vortz[1],\
                    idx_turb_Fr_vortz[2]].mean())

                avg_mdisp = np.append(avg_mdisp, mdisp[i,:,:,:].mean())
                avg_lam_mdisp = np.append(avg_lam_mdisp,\
                    mdisp[i,idx_lam[0],idx_lam[1],idx_lam[2]].mean())
                avg_turb_mdisp = np.append(avg_turb_mdisp,\
                    mdisp[i,idx_turb[0],idx_turb[1],idx_turb[2]].mean())
                avg_lam_Fr_mdisp = np.append(avg_lam_Fr_mdisp,\
                    mdisp[i,idx_lam_Fr[0],idx_lam_Fr[1],idx_lam_Fr[2]].mean())
                avg_turb_Fr_mdisp = np.append(avg_turb_Fr_mdisp,\
                    mdisp[i,idx_turb_Fr[0],idx_turb_Fr[1],idx_turb_Fr[2]].mean())
                avg_lam_Fr_vortz_mdisp = np.append(avg_lam_Fr_vortz_mdisp,\
                    mdisp[i,idx_lam_Fr_vortz[0],idx_lam_Fr_vortz[1],\
                    idx_lam_Fr_vortz[2]].mean())
                avg_turb_Fr_vortz_mdisp = np.append(avg_turb_Fr_vortz_mdisp,\
                    mdisp[i,idx_turb_Fr_vortz[0],idx_turb_Fr_vortz[1],\
                    idx_turb_Fr_vortz[2]].mean())

                # computing global eta
                avg_global_eta = np.append(avg_global_eta,\
                    (B*avg_tdisp[-1]/Pe)/\
                    (B*avg_tdisp[-1]/Pe + avg_mdisp[-1]/Re))
                avg_global_lam_eta = np.append(avg_global_lam_eta,\
                    (B*avg_lam_tdisp[-1]/Pe)/(B*avg_lam_tdisp[-1]/Pe +\
                    avg_lam_mdisp[-1]/Re))
                avg_global_turb_eta = np.append(avg_global_turb_eta,\
                    (B*avg_turb_tdisp[-1]/Pe)/\
                    (B*avg_turb_tdisp[-1]/Pe + avg_turb_mdisp[-1]/Re))
                avg_global_lam_Fr_eta = np.append(avg_global_lam_Fr_eta,\
                    (B*avg_lam_Fr_tdisp[-1]/Pe)/(B*avg_lam_Fr_tdisp[-1]/Pe +\
                    avg_lam_Fr_mdisp[-1]/Re))
                avg_global_turb_Fr_eta = np.append(avg_global_turb_Fr_eta,\
                    (B*avg_turb_Fr_tdisp[-1]/Pe)/\
                    (B*avg_turb_Fr_tdisp[-1]/Pe + avg_turb_Fr_mdisp[-1]/Re))
                avg_global_lam_Fr_vortz_eta = np.append(avg_global_lam_Fr_vortz_eta,\
                    (B*avg_lam_Fr_vortz_tdisp[-1]/Pe)/(B*avg_lam_Fr_vortz_tdisp[-1]/Pe +\
                    avg_lam_Fr_vortz_mdisp[-1]/Re))
                avg_global_turb_Fr_vortz_eta = np.append(avg_global_turb_Fr_vortz_eta,\
                    (B*avg_turb_Fr_vortz_tdisp[-1]/Pe)/\
                    (B*avg_turb_Fr_vortz_tdisp[-1]/Pe + avg_turb_Fr_vortz_mdisp[-1]/Re))

                vlam = np.append(vlam, len(idx_lam[0])/np_tot)
                vlam_Fr = np.append(vlam_Fr, len(idx_lam_Fr[0])/np_tot)
                vlam_Fr_vortz = np.append(vlam_Fr_vortz, \
                    len(idx_lam_Fr_vortz[0])/np_tot)

                vturb = np.append(vturb, len(idx_turb[0])/np_tot)
                vturb_Fr = np.append(vturb_Fr, len(idx_turb_Fr[0])/np_tot)
                vturb_Fr_vortz = np.append(vturb_Fr_vortz, \
                    len(idx_turb_Fr_vortz[0])/np_tot)
                            
            del uh
            del eta
            del tdisp
            del mdisp
            del vortz
        
        # remove repeated timesteps and sort chronologically
        t, indices = np.unique(t_tot,return_index=True)
        del t_tot

        avg_uh = avg_uh[indices]

        avg_tdisp = avg_tdisp[indices]
        avg_lam_tdisp = avg_lam_tdisp[indices]
        avg_lam_Fr_tdisp = avg_lam_Fr_tdisp[indices]
        avg_lam_Fr_vortz_tdisp = avg_lam_Fr_vortz_tdisp[indices]
        avg_turb_tdisp = avg_turb_tdisp[indices]
        avg_turb_Fr_tdisp = avg_turb_Fr_tdisp[indices]
        avg_turb_Fr_vortz_tdisp = avg_turb_Fr_vortz_tdisp[indices]

        avg_mdisp = avg_mdisp[indices]
        avg_lam_mdisp = avg_lam_mdisp[indices]
        avg_lam_Fr_mdisp = avg_lam_Fr_mdisp[indices]
        avg_lam_Fr_vortz_mdisp = avg_lam_Fr_vortz_mdisp[indices]
        avg_turb_mdisp = avg_turb_mdisp[indices]
        avg_turb_Fr_mdisp = avg_turb_Fr_mdisp[indices]
        avg_turb_Fr_vortz_mdisp = avg_turb_Fr_vortz_mdisp[indices]

        avg_local_eta = avg_local_eta[indices]
        avg_local_lam_eta = avg_local_lam_eta[indices]
        avg_local_lam_Fr_eta = avg_local_lam_Fr_eta[indices]
        avg_local_lam_Fr_vortz_eta = avg_local_lam_Fr_vortz_eta[indices]
        avg_local_turb_eta = avg_local_turb_eta[indices]
        avg_local_turb_Fr_eta = avg_local_turb_Fr_eta[indices]
        avg_local_turb_Fr_vortz_eta = avg_local_turb_Fr_vortz_eta[indices]


        avg_global_eta = avg_global_eta[indices]
        avg_global_lam_eta = avg_global_lam_eta[indices]
        avg_global_lam_Fr_eta = avg_global_lam_Fr_eta[indices]
        avg_global_lam_Fr_vortz_eta = avg_global_lam_Fr_vortz_eta[indices]
        avg_global_turb_eta = avg_global_turb_eta[indices]
        avg_global_turb_Fr_eta = avg_global_turb_Fr_eta[indices]
        avg_global_turb_Fr_vortz_eta = avg_global_turb_Fr_vortz_eta[indices]

        vlam = vlam[indices]
        vlam_Fr = vlam_Fr[indices]
        vlam_Fr_vortz = vlam_Fr_vortz[indices]

        vturb = vturb[indices]
        vturb_Fr = vturb_Fr[indices]
        vturb_Fr_vortz = vturb_Fr_vortz[indices]

        Nt = len(t)
        io_file.write('# Index {:03d}: Re = {:6.2f}, Pe = {:6.2f}, B = {:6.2f}'\
            .format(index_counter,Re,Pe,B))
        io_file.write('\n')
        index_counter += 1
        # write to output file
        for i in range(Nt):
            io_file.write(fmt_str.format(Re,B,Pe/Re,Pe,B*Pe,t[i],avg_uh[i],\
            avg_tdisp[i],avg_mdisp[i],avg_local_eta[i],avg_global_eta[i],\
            avg_lam_tdisp[i],avg_lam_mdisp[i],\
            avg_local_lam_eta[i],avg_global_lam_eta[i],\
            avg_turb_tdisp[i],avg_turb_mdisp[i],\
            avg_local_turb_eta[i],avg_global_turb_eta[i],\
            avg_lam_Fr_tdisp[i],avg_lam_Fr_mdisp[i],\
            avg_local_lam_Fr_eta[i],avg_global_lam_Fr_eta[i],\
            avg_turb_Fr_tdisp[i],avg_turb_Fr_mdisp[i],\
            avg_local_turb_Fr_eta[i],avg_global_turb_Fr_eta[i],\
            avg_lam_Fr_vortz_tdisp[i],avg_lam_Fr_vortz_mdisp[i],\
            avg_local_lam_Fr_vortz_eta[i],avg_global_lam_Fr_vortz_eta[i],\
            avg_turb_Fr_vortz_tdisp[i],avg_turb_Fr_vortz_mdisp[i],\
            avg_local_turb_Fr_vortz_eta[i],avg_global_turb_Fr_vortz_eta[i],\
            vlam[i],vturb[i],\
            vlam_Fr[i],vturb_Fr[i],\
            vlam_Fr_vortz[i],vturb_Fr_vortz[i]))
            io_file.write('\n')

        # do temporal averages and write to file
        lb, ub = bounds[m][n]
        print('LB: ', lb, ', UB: ', ub)
        tidx = np.where((lb <= t) & (t <= ub))

        avg_uh = avg_uh[tidx].mean()

        avg_tdisp = avg_tdisp[tidx].mean()
        print('Shape/Value of avg_tdisp: ', avg_tdisp)
        avg_lam_tdisp = avg_lam_tdisp[tidx].mean()
        avg_lam_Fr_tdisp = avg_lam_Fr_tdisp[tidx].mean()
        avg_lam_Fr_vortz_tdisp = avg_lam_Fr_vortz_tdisp[tidx].mean()
        avg_turb_tdisp = avg_turb_tdisp[tidx].mean()
        avg_turb_Fr_tdisp = avg_turb_Fr_tdisp[tidx].mean()
        avg_turb_Fr_vortz_tdisp = avg_turb_Fr_vortz_tdisp[tidx].mean()

        avg_mdisp = avg_mdisp[tidx].mean()
        avg_lam_mdisp = avg_lam_mdisp[tidx].mean()
        avg_lam_Fr_mdisp = avg_lam_Fr_mdisp[tidx].mean()
        avg_lam_Fr_vortz_mdisp = avg_lam_Fr_vortz_mdisp[tidx].mean()
        avg_turb_mdisp = avg_turb_mdisp[tidx].mean()
        avg_turb_Fr_mdisp = avg_turb_Fr_mdisp[tidx].mean()
        avg_turb_Fr_vortz_mdisp = avg_turb_Fr_vortz_mdisp[tidx].mean()

        avg_local_eta = avg_local_eta[tidx].mean()
        avg_local_lam_eta = avg_local_lam_eta[tidx].mean()
        avg_local_lam_Fr_eta = avg_local_lam_Fr_eta[tidx].mean()
        avg_local_lam_Fr_vortz_eta = avg_local_lam_Fr_vortz_eta[tidx].mean()
        avg_local_turb_eta = avg_local_turb_eta[tidx].mean()
        avg_local_turb_Fr_eta = avg_local_turb_Fr_eta[tidx].mean()
        avg_local_turb_Fr_vortz_eta = avg_local_turb_Fr_vortz_eta[tidx].mean()


        avg_global_eta = avg_global_eta[tidx].mean()
        avg_global_lam_eta = avg_global_lam_eta[tidx].mean()
        avg_global_lam_Fr_eta = avg_global_lam_Fr_eta[tidx].mean()
        avg_global_lam_Fr_vortz_eta = avg_global_lam_Fr_vortz_eta[tidx].mean()
        avg_global_turb_eta = avg_global_turb_eta[tidx].mean()
        avg_global_turb_Fr_eta = avg_global_turb_Fr_eta[tidx].mean()
        avg_global_turb_Fr_vortz_eta = avg_global_turb_Fr_vortz_eta[tidx].mean()

        vlam = vlam[tidx].mean()
        vlam_Fr = vlam_Fr[tidx].mean()
        vlam_Fr_vortz = vlam_Fr_vortz[tidx].mean()

        vturb = vturb[tidx].mean()
        vturb_Fr = vturb_Fr[tidx].mean()
        vturb_Fr_vortz = vturb_Fr_vortz[tidx].mean()


        tavg_file.write(tavg_fmt_str.format(Re,B,Pe/Re,Pe,B*Pe,lb,ub,avg_uh,\
            avg_tdisp,avg_mdisp,avg_local_eta,avg_global_eta,\
            avg_lam_tdisp,avg_lam_mdisp,\
            avg_local_lam_eta,avg_global_lam_eta,\
            avg_turb_tdisp,avg_turb_mdisp,\
            avg_local_turb_eta,avg_global_turb_eta,\
            avg_lam_Fr_tdisp,avg_lam_Fr_mdisp,\
            avg_local_lam_Fr_eta,avg_global_lam_Fr_eta,\
            avg_turb_Fr_tdisp,avg_turb_Fr_mdisp,\
            avg_local_turb_Fr_eta,avg_global_turb_Fr_eta,\
            avg_lam_Fr_vortz_tdisp,avg_lam_Fr_vortz_mdisp,\
            avg_local_lam_Fr_vortz_eta,avg_global_lam_Fr_vortz_eta,\
            avg_turb_Fr_vortz_tdisp,avg_turb_Fr_vortz_mdisp,\
            avg_local_turb_Fr_vortz_eta,avg_global_turb_Fr_vortz_eta,\
            vlam,vturb,\
            vlam_Fr,vturb_Fr,\
            vlam_Fr_vortz,vturb_Fr_vortz))
        tavg_file.write('\n')
        io_file.write('\n\n\n')
    io_file.write('\n\n\n')
        


