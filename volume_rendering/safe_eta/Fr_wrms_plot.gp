reset
#set multiplot layout 3,1 columnsfirst 

set tics font "Roman,15"
set title font "Roman,25"
set key font "Roman,15"

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
# 45 - wturb # 46 - wlam_Fr
# 47 - wturb_Fr
# 48 - wlam_Fr_vortz
# 49 - wturb_Fr_vortz
# 50 - wlam_weighted
# 51 - wturb_weighted
# 52 - wlam_Fr_weighted
# 53 - wturb_Fr_weighed


# -------------------------------------------------------------

# First Plot - set perform_block_1 to 1 to run this block

perform_block_1 = 0

if (perform_block_1) {

set xlabel "Fr^{-1}" font "Roman,20"
set key top right
#set ylabel "Eta" rotate by 0 
set title "Normal"
set log xy
set yrange [1e-3:2]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($2**0.5):43 pt 5 ps 2 lc rgb "magenta" title 'Steady: Wrms',\
"" i 0:2:2 u ($2**0.5):44 pt 5 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:2:2 u ($2**0.5):45 pt 5 ps 2 lc rgb "blue" title '       Wturb',\
"" i 0:2:2 u ($2**0.5):50 pt 4 ps 2 lc rgb "red" title '       Wlam wght',\
"" i 0:2:2 u ($2**0.5):51 pt 4 ps 2 lc rgb "blue" title '       Wlam wght',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($2**0.5):43 pt 7 ps 2 lc rgb "magenta" title 'Stoch: Wrms',\
"" i 0:1 u ($2**0.5):44 pt 7 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:1 u ($2**0.5):45 pt 7 ps 2 lc rgb "blue" title '       Wturb',\
"" i 0:1 u ($2**0.5):50 pt 6 ps 2 lc rgb "red" title '       Wlam wght',\
"" i 0:1 u ($2**0.5):51 pt 6 ps 2 lc rgb "blue" title '       Wlam wght',\

} # end block 1

# -------------------------------------------------------------

# Second Plot - set perform_block_2 to 1 to run this block

perform_block_2 = 0

if (perform_block_2){

set xlabel "Fr_{eff}^{-1}"
set key top right
#set ylabel "Eta" rotate by 0 
set title "Using Effective Fr"
set log xy


plot "steady_tavg_eta.dat" \
   i 0:2:2 u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "magenta" title 'Steady: Wrms',\
"" i 0:2:2 u (($2**0.5)/$8):46 pt 5 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:2:2 u (($2**0.5)/$8):47 pt 5 ps 2 lc rgb "blue" title '       Wturb',\
"" i 0:2:2 u (($2**0.5)/$8):52 pt 4 ps 2 lc rgb "red" title '       Wlam wght',\
"" i 0:2:2 u (($2**0.5)/$8):53 pt 4 ps 2 lc rgb "blue" title '       Wlam wght',\
"stoch_tavg_eta.dat" \
   i 0:1 u (($2**0.5)/$8):43 pt 7 ps 2 lc rgb "magenta" title 'Stoch: Wrms',\
"" i 0:1 u (($2**0.5)/$8):46 pt 7 ps 2 lc rgb "red" title '       Wlam',\
"" i 0:1 u (($2**0.5)/$8):47 pt 7 ps 2 lc rgb "blue" title '       Wturb',\
"" i 0:1 u (($2**0.5)/$8):52 pt 6 ps 2 lc rgb "red" title '       Wlam wght',\
"" i 0:1 u (($2**0.5)/$8):53 pt 6 ps 2 lc rgb "blue" title '       Wlam wght',\

} # end block 2

# -------------------------------------------------------------

# Third Plot - set perform_block_3 to 1 to run this block

perform_block_3 = 0

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
[1:7.5] 0.4*x**(-0.5) dt 2 lw 1 lc rgb "blue" title '0.45 Fr_{eff}^{-1/2}',\
[1:7.5] 0.25*x**(-1) dt 2 lw 1 lc rgb "red" title '0.35 Fr_{eff}^{-1}'



# steady 
#"" i 0:2:2 u (($2**0.5)/$8):48 pt 5 ps 2 lc rgb "blue" title '       Wlam',\
#"" i 0:2:2 u (($2**0.5)/$8):49 pt 5 ps 2 lc rgb "blue" title '       Wturb',\
#"" i 0 u (($2**0.5)/$8):8 pt 5 ps 2 lc rgb "green" title '       uh_{rms}',\

#stoch
#"" i 0:1 u (($2**0.5)/$8):48 pt 7 ps 2 lc rgb "red" title '       Wlam',\
#"" i 0:1 u (($2**0.5)/$8):49 pt 7 ps 2 lc rgb "blue" title '       Wturb',\
#"" i 0 u (($2**0.5)/$8):8 pt 9 ps 2 lc rgb "green" title '       uh_{rms}',\

} # end of block 3


# -------------------------------------------------------------

# Fourth Plot - set perform_block_3 to 1 to run this block

perform_block_4 = 1

if (perform_block_4) {

set xlabel "Fr^{-1}" font "Roman,20"
set key top right
set ylabel "w_{rms}" rotate by 0 font "Roman,20"
set title "Re600 Pe60 and Re1000 Pe100"
set log xy
set size ratio .8
#set yrange [1e-3:10]
set xrange [.1:100]


plot "steady_tavg_eta.dat" \
  i 0 u (($2**0.5)/$8):8 pt 5 ps 2 lc rgb "green" title '       uh_{rms}',\
"stoch_tavg_eta.dat" \
   i 0 u (($2**0.5)/$8):8 pt 9 ps 2 lc rgb "green" title '       uh_{rms}',\
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

} # end of block 3

