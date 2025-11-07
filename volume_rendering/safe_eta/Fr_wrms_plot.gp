reset
#set multiplot layout 2,1 columnsfirst 

png_output = 0

if (png_output){
    set terminal png enh col
    set output "plot_Fr_wrms.png"
}

set tics font "Roman,15"
set title font "Roman,25"
set key font "Roman,15"
set xlabel font "Roman,20"
set ylabel font "Roman,20"

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

perform_block_1 = 1

# {{{ First Plot - set perform_block_1 to 1 to run this block

if (perform_block_1) {

set xlabel "Fr^{-1}" font "Roman,20"
set key top right
set title "Normal"
set log xy
set yrange [1e-3:2]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($2**0.5):12:13   w yerrorbars pt 4 ps 2 lc rgb "dark-violet" title 'Steady: Wrms',\
"" i 0:2:2 u ($2**0.5):94:95   w yerrorbars pt 4 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:2:2 u ($2**0.5):96:97   w yerrorbars pt 4 ps 2 lc rgb "blue" title '       Wturb',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($2**0.5):12:13   w yerrorbars pt 9 ps 2 lc rgb "dark-violet" title 'Stoch.: Wrms',\
"" i 0:1 u ($2**0.5):94:95   w yerrorbars pt 9 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:1 u ($2**0.5):96:97   w yerrorbars pt 9 ps 2 lc rgb "blue" title '       Wturb',\

} # end block 1 }}}

# -------------------------------------------------------------

perform_block_2 = 0

# {{{ Second Plot - set perform_block_2 to 1 to run this block


if (perform_block_2){

set xlabel "Fr_{eff}^{-1}"
set key top right
set ylabel "w_{rms}/u_{h,rms}"
set title "Effective w_{rms} v Fr"
set log xy


plot "steady_tavg_eta.dat" \
   i 0:2:2 u (($2**0.5)/$8):($12/$8):($13/$8)   w yerrorbars pt 4 ps 2 lc rgb "dark-violet" title 'Steady: Wrms',\
"" i 0:2:2 u (($2**0.5)/$8):($94/$8):($95/$8)   w yerrorbars pt 4 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:2:2 u (($2**0.5)/$8):($96/$8):($97/$8) w yerrorbars pt 4 ps 2 lc rgb "blue" title '       Wturb',\
"stoch_tavg_eta.dat" \
   i 0:1 u (($2**0.5)/$8):($12/$8):($13/$8)   w yerrorbars pt 9 ps 2 lc rgb "dark-violet" title 'Stoch.: Wrms',\
"" i 0:1 u (($2**0.5)/$8):($94/$8):($95/$8)   w yerrorbars pt 9 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:1 u (($2**0.5)/$8):($96/$8):($97/$8) w yerrorbars pt 9 ps 2 lc rgb "blue" title '       Wturb',\
[1:7.5] 0.35**(-0.5) dt 2 lw 1 lc rgb "blue" title '0.35 Fr_{eff}^{-1/2}',\
[1:7.5] 0.25**(-1) dt 2 lw 1 lc rgb "red" title '0.25 Fr_{eff}^{-1}'


} # end block 2 }}}

# -------------------------------------------------------------

perform_block_3 = 0

# {{{ Third Plot - set perform_block_3 to 1 to run this block

if (perform_block_3) {

set xlabel "Fr_{eff}^{-1}"
set key top right
set ylabel "w_{rms, eff}" rotate by 0 
set title "Re600 Pe60 and Re1000 Pe100"
set log xy
3#set yrange [1e-3:10]
set xrange [.1:100]


plot "steady_tavg_eta.dat" \
   i 0 u (($2**0.5)/$8):($43/$8) pt 4 ps 2 lc rgb "dark-violet" title 'Steady: Wrms',\
"" i 0 u (($2**0.5)/$8):($50/$8) pt 4 ps 2 lc rgb "red" title '       Wlam',\
"" i 0 u (($2**0.5)/$8):($51/$8) pt 4 ps 2 lc rgb "blue" title '       Wturb',\
"stoch_tavg_eta.dat" \
   i 0 u (($2**0.5)/$8):($43/$8) pt 9 ps 2 lc rgb "dark-violet" title 'Stoch: Wrms',\
"" i 0 u (($2**0.5)/$8):($50/$8) pt 9 ps 2 lc rgb "red" title '       Wlam',\
"" i 0 u (($2**0.5)/$8):($51/$8) pt 9 ps 2 lc rgb "blue" title '       wturb',\
[1:7.5] 0.35**(-0.5) dt 2 lw 1 lc rgb "blue" title '0.35 Fr_{eff}^{-1/2}',\
[1:7.5] 0.25**(-1) dt 2 lw 1 lc rgb "red" title '0.25 Fr_{eff}^{-1}'



# steady 
#"" i 0:2:2 u (($2**0.5)/$8):48 pt 5 ps 2 lc rgb "blue" title '       Wlam',\
#"" i 0:2:2 u (($2**0.5)/$8):49 pt 5 ps 2 lc rgb "blue" title '       Wturb',\
#"" i 0 u (($2**0.5)/$8):8 pt 5 ps 2 lc rgb "green" title '       uh_{rms}',\

#stoch
#"" i 0:1 u (($2**0.5)/$8):48 pt 7 ps 2 lc rgb "red" title '       Wlam',\
#"" i 0:1 u (($2**0.5)/$8):49 pt 7 ps 2 lc rgb "blue" title '       Wturb',\
#"" i 0 u (($2**0.5)/$8):8 pt 9 ps 2 lc rgb "green" title '       uh_{rms}',\

} # end of block 3 }}}

# -------------------------------------------------------------

perform_block_4 = 0

# {{{ Fourth Plot - set perform_block_3 to 1 to run this block


if (perform_block_4) {

set xlabel "Fr^{-1}"
set key top right
set ylabel "w_{rms}" rotate by 0
set title "Re600 Pe60 and Re1000 Pe100"
set log xy
set size ratio .8
#set yrange [1e-3:10]
set xrange [.1:100]


plot "steady_tavg_eta.dat" \
   i 0 u (($2**0.5)/$8):($43/$8) pt 5 ps 2 lc rgb "dark-violet" title "Steady: w_{rms}",\
"" i 0 u (($2**0.5)):(0.25*(($2**0.5)**(-1))*$41 + 0.35*(($2**0.5)**(-0.5))*$42) pt 9 ps 2 lc rgb "green" title "Steady: w_{recon}",\
"stoch_tavg_eta.dat" \
   i 0 u (($2**0.5)/$8):($43/$8) pt 9 ps 2 lc rgb "dark-violet" title "Stoch: w_{rms}",\
"" i 0 u (($2**0.5)):(0.25*(($2**0.5)**(-1))*$41 + 0.35*(($2**0.5)**(-0.5))*$42) pt 9 ps 2 lc rgb "green" title "Stoch: w_{recon}",\



   #i 0 u (($2**0.5)):43 pt 9 ps 2 lc rgb "dark-violet" title 'Stoch: Wrms',\
#"" i 0 u (($2**0.5)):50 pt 9 ps 2 lc rgb "red" title '       Wlam',\
#"" i 0 u (($2**0.5)):51 pt 9 ps 2 lc rgb "blue" title '       wturb',\
#[3:20] 1.6*x**(-0.5) dt 2 lw 1 lc rgb "blue" title '1.6 Fr^{-1/2}',\
#[3:20] 2*x**(-1) dt 2 lw 1 lc rgb "red" title '2 Fr^{-1}'


   #i 0 u (($2**0.5)):43 pt 4 ps 2 lc rgb "dark-violet" title 'Steady: Wrms',\
#"" i 0 u (($2**0.5)):50 pt 4 ps 2 lc rgb "red" title '       Wlam',\
#"" i 0 u (($2**0.5)):51 pt 4 ps 2 lc rgb "blue" title '       Wturb',\


# steady 
#"" i 0:2:2 u (($2**0.5)/$8):48 pt 5 ps 2 lc rgb "blue" title '       Wlam',\
#"" i 0:2:2 u (($2**0.5)/$8):49 pt 5 ps 2 lc rgb "blue" title '       Wturb',\
#"" i 0 u (($2**0.5)/$8):8 pt 5 ps 2 lc rgb "green" title '       uh_{rms}',\

#stoch
#"" i 0:1 u (($2**0.5)/$8):48 pt 7 ps 2 lc rgb "red" title '       Wlam',\
#"" i 0:1 u (($2**0.5)/$8):49 pt 7 ps 2 lc rgb "blue" title '       Wturb',\
#"" i 0 u (($2**0.5)/$8):8 pt 9 ps 2 lc rgb "green" title '       uh_{rms}',\

} # end of block 4 }}}

