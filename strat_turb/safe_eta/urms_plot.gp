reset
#set multiplot layout 3,1 columnsfirst 

set title font "Roman, 25"
set key font "Roman, 20"
set tics font "Roman, 15"
set xlabel font "Roman, 20"
set ylabel font "Roman, 20"
set size ratio 0.8

idx = 0

# file key: 
# steady_tavg_eta.dat: 
# idx 0: Re600_Pe60
# idx 1: Re600_Pe30
# idx 2: Re1000_Pe100
# idx 3: Re300_Pe30
# idx 4: Re1000_Pe10

# stoch_tavg_eta.dat:
# idx 0: Re600_Pe60
# idx 1: Re1000_Pe100

# in each file:
# 43 - wrms
# 44 - wlam
# 45 - wturb
# 46 - wlam_Fr
# 47 - wturb_Fr
# 48 - wlam_Fr_vortz
# 49 - wturb_Fr_vortz
# 50 - wlam_weighted
# 51 - wturb_weighted
# 52 - wlam_Fr_weighted
# 53 - wturb_Fr_weighed


# -------------------------------------------------------------

# First Plot - set perform_block_1 to 1 to run this block

perform_block_1 = 1

if (perform_block_1) {

set xlabel "Re_b"
set key top right
set ylabel "u_{h, rms}" rotate by 0 
set log x

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($1/$2):8 pt 4 ps 4 lc rgb "dark-violet" title 'Steady',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($1/$2):8 pt 9 ps 4 lc rgb "dark-violet" title 'Stochastic',\

#Steady: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\

#Stoch: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\

} # end of block 1

# -------------------------------------------------------------

# Second Plot - set perform_block_2 to 1 to run this block

perform_block_2 = 0

if (perform_block_2) {

set xlabel "Fr_{eff}^{-1}"
set key top right
set ylabel "w_{rms, eff}" rotate by 0 
set title "w_{rms, eff} reconstruction"
set log xy

# (($2**0.5)/$8) = (B**(0.5)/uh_rms)
# 41 = VLam
# 42 = Vturb
#

plot "steady_tavg_eta.dat" \
   i 0:2:2 u (($2**0.5)/$8):($43) pt 5 ps 1 lc rgb "dark-violet" title 'Steady Actual',\
"" i 0:2:2 u (($2**0.5)/$8):((((1.8*(($2**0.5))**(-1))**2)*$37 + ((1.5*(($2**0.5))**(-0.5))**2)*$38)) pt 5 ps 1 lc rgb "black" title 'Steady Reconstructed',\
"stoch_tavg_eta.dat" \
   i 0:1 u (($2**0.5)):($43**2) pt 9 ps 2 lc rgb "dark-violet" title 'Stoch. Actual',\
"" i 0:1 u (($2**0.5)):((((1.8*(($2**0.5))**(-1))**2)*$37 + ((1.5*(($2**0.5))**(-0.5))**2)*$38)) pt 9 ps 2 lc rgb "black" title 'Stoch. Reconstructed',\
#[1:10] 0.4*x**(-1) dt 2 lw 2 lc rgb "forest-green" title '0.4 Fr_{eff}^{-1}'

#Steady: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\

#Stoch: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\

} # end of block 1

# -------------------------------------------------------------

# Third Plot - set perform_block_3 to 1 to run this block

perform_block_3 = 0

if (perform_block_3) {

set xlabel "Fr^{-1}"
set key top right
set ylabel "w" rotate by 0 
set title "Normalization Without reconstruction"
set log xy

# (($2**0.5)/$8) = (B**(0.5)/uh_rms)
# 37 - Vlam
# 38 - Vturb
# 41 = VLam_eff
# 42 = Vturb_eff
#

plot "steady_tavg_eta.dat" \
   i 0:2:2 u (($2**0.5)):($43) pt 5 ps 1 lc rgb "dark-violet" title 'Steady Actual',\
"" i 0:2:2 u (($2**0.5)):((1.8*(($2**0.5))**(-1))*$37 + (1.5*(($2**0.5))**(-0.5))*$38) pt 5 ps 1 lc rgb "black" title 'Steady Reconstructed',\
"stoch_tavg_eta.dat" \
   i 0:1 u (($2**0.5)):($43) pt 9 ps 2 lc rgb "dark-violet" title 'Stoch. Actual',\
"" i 0:1 u   (($2**0.5)):((1.8*(($2**0.5))**(-1))*$37 + (1.5*(($2**0.5))**(-0.5))*$38) pt 9 ps 2 lc rgb "black" title 'Stoch. Reconstructed',\
#[1:10] 0.4*x**(-1) dt 2 lw 2 lc rgb "forest-green" title '0.4 Fr_{eff}^{-1}'

#Steady: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\

#Stoch: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\

} # end of block 3

# -------------------------------------------------------------

# Fourth Plot - set perform_block_3 to 1 to run this block

perform_block_4 = 0

if (perform_block_4) {

set xlabel "Fr_{eff}^{-1}"
set key top right
set ylabel "w_{rms, eff}" rotate by 0 
set title "w_{rms, eff} reconstruction"
set log xy

# (($2**0.5)/$8) = (B**(0.5)/uh_rms)
# 41 = VLam
# 42 = Vturb
#

plot "steady_tavg_eta.dat" \
   i 0:2:2 u (($2**0.5)/$8):($43/$8) pt 5 ps 1 lc rgb "dark-violet" title 'Steady Actual',\
"" i 0:2:2 u (($2**0.5)/$8):(((1.9*(($2**0.5)/$8)**(-1))*$41 + (1*(($2**0.5)/$8)**(-0.5))*$42)/$8) pt 5 ps 1 lc rgb "black" title 'Steady Reconstructed',\
"stoch_tavg_eta.dat" \
   i 0:1 u (($2**0.5)/$8):($43/$8) pt 9 ps 2 lc rgb "dark-violet" title 'Stoch. Actual',\
"" i 0:1 u   (($2**0.5)/$8):(((1.9*(($2**0.5)/$8)**(-1))*$41 + (1*(($2**0.5)/$8)**(-0.5))*$42)/$8) pt 9 ps 2 lc rgb "black" title 'Stoch. Reconstructed',\
#[1:10] 0.4*x**(-1) dt 2 lw 2 lc rgb "forest-green" title '0.4 Fr_{eff}^{-1}'

#Steady: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 5 ps 2 lc rgb "black" title 'Reconstructed',\

#Stoch: 
#"" i 0:2:2 u (($2**0.5)/$8):($48*$41 + $49*$42) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\
#"" i 0:2:2 u (($2**0.5)/$8):($46*$39 + $47*$40) pt 9 ps 2 lc rgb "black" title 'Reconstructed',\

} # end of block 4


