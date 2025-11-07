reset
set multiplot layout 3,1 columnsfirst 

set tics font "Roman,15"
set title font "Roman,25"
set key font "Roman,15"
set xlabel font "Roman,20"
set ylabel font "Roman,20"
ub = 0.7
idx = 0
pwr = 1

# {{{file key: 
# steady_tavg_eta.dat: 
# idx 0: Re600_Pe60
# idx 1: Re600_Pe30
# idx 2: Re1000_Pe100
# idx 3: Re300_Pe30
# idx 4: Re1000_Pe10

# stoch_tavg_eta.dat:
# idx 0: Re600_Pe60
# idx 1: Re1000_Pe100
# }}}
# {{{ Columns 
# in each file:
# Re(1)
# B(2) 
# Pr(3)
# Pe(4)
# BPe(5)
# lb(6)
# ub(7)
# uh_rms(8/9)
# vortz_rms(10/11)   
# wrms(12/13)
# tdisp(14/15)
# mdisp(16/17)
# eta (local)(18/19)
# eta (global)(20/21)   
# lam_wrms(22/23)
# lam tdisp(24/25)
# lam mdisp(26/27)
# lam eta (local)(28/29)
# lam eta (global)(30/31)    
# turb_wrms (32/33)
# turb tdisp (34/35)
# turb mdisp (36/37)
# turb eta (local)(38/39)
# turb eta (global)(40/41)
# lam_Fr_wrms(42/43) 
# lam_Fr tdisp(44/45)
# lam_Fr mdisp (46/47)
# lam_Fr eta (local) (48/49)
# lam_Fr eta (global)(50/51)
# turb_Fr_wrms(52/53) 
# turb_Fr tdisp (54/55)
# turb_Fr mdisp (56/57)
# turb_Fr eta (local) (58/59)
# turb_Fr eta (global)(60/61)
# lam_Fr_wmrs(62/63)
# lam_Fr_vortz tdisp(64/65)
# lam_Fr_vortz mdisp(66/67)
# lam_Fr_vortz eta (local)(68/69)
# lam_Fr_vortz eta (global)(70/71)
# turb_Fr_wrms(72/73)
# turb_Fr_vortz tdisp (74/75)
# turb_Fr_vortz mdisp(76/77)
# turb_Fr_vortz eta(local)(78/79)
# turb_Fr_vortz eta(glbal)(80/81) 
# vlam(82/83)
# vturb(84/85)
# vlam_Fr(86/87)
# vturb_Fr(88/89)
# vlam_Fr_vortz (90/91)
# vturb_Fr_vortz (92/93)
# wlam_wght (94/95) 
# wturb_wght (96/97)
# wlam_eff_wght(98/99)
# wturb_eff_wght (100/101) 
# }}}

# -------------------------------------------------------------

perform_block_1 = 0

# {{{ First Plot

if (perform_block_1) {

set xlabel "Re_{B}" font "Roman,20"
set key top right
set ylabel "{/Symbol h}"
set title "Effective {/Symbol h} v Re_b"
set log x
set yrange [0:1]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($8**3*$1/$2):20:21 w yerrorbars pt 4 ps 2 lc rgb "dark-violet" title 'Steady Eta',\
"" i 0:2:2 u ($8**3*$1/$2):70:71 w yerrorbars pt 4 ps 2 lc rgb "red" title 'Steady Eta_{Lam}',\
"" i 0:2:2 u ($8**3*$1/$2):80:81 w yerrorbars pt 4 ps 2 lc rgb "blue" title 'Steady Eta_{Turb}',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($8**3*$1/$2):20:21 w yerrorbars pt 9 ps 2 lc rgb "dark-violet" title 'Steady Eta',\
"" i 0:1 u ($8**3*$1/$2):70:71 w yerrorbars pt 9 ps 2 lc rgb "red" title 'Steady Eta_{Lam}',\
"" i 0:1 u ($8**3*$1/$2):80:81 w yerrorbars pt 9 ps 2 lc rgb "blue" title 'Steady Eta_{Turb}',\

} # end of block 1 }}}

# -------------------------------------------------------------

perform_block_2 = 1

# {{{ Second Plot

if (perform_block_2) {

set xlabel "Re_{B}"
set key top right
set ylabel "{/Symbol h}"
set title "Effective Re_{B} v {/Symbol h}"
set log x
set yrange [0:ub]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($8**3*$1/$2):20:21 w yerrorbars pt 4 ps 2 lc rgb "dark-violet" title 'Steady Eta',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($8**3*$1/$2):20:21 w yerrorbars pt 9 ps 2 lc rgb "dark-violet" title 'Steady Eta',\

} # end of block 2 }}} 

# -------------------------------------------------------------

perform_block_3 = 1

# {{{ Third Plot

if (perform_block_3) {

set xlabel "Re_{B}"
set key top right
set ylabel "{/Symbol h}"
set title "Effective Re_{B} v {/Symbol h}_{Lam}"
set log x
set yrange [0:ub]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($8**3*$1/$2):70:71 w yerrorbars pt 4 ps 2 lc rgb "red" title 'Steady Eta_{Lam}',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($8**3*$1/$2):70:71 w yerrorbars pt 9 ps 2 lc rgb "red" title 'Steady Eta_{Lam}',\

} # end of block 3 }}} 

# -------------------------------------------------------------

perform_block_4 = 1

# {{{ Fourth Plot

if (perform_block_4) {

set xlabel "Re_{B}"
set key top right
set ylabel "{/Symbol h}"
set title "Effective Re_{B} v {/Symbol h}_{Turb}"
set log x
set yrange [0:ub]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($8**3*$1/$2):80:81 w yerrorbars pt 4 ps 2 lc rgb "blue" title 'Steady Eta_{Turb}',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($8**3*$1/$2):80:81 w yerrorbars pt 9 ps 2 lc rgb "blue" title 'Steady Eta_{Turb}',\

} # end of block 3 }}} 

# -------------------------------------------------------------
