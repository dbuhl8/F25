reset
#set multiplot layout 3,1 columnsfirst 

idx = 0
set tics font "Roman,15"
set title font "Roman,25"
set key font "Roman,15"
set xlabel font "Roman,20"
set ylabel font "Roman,20"
set size ratio 0.8

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

# First Plot

perform_block_1 = 0

if (perform_block_1) {

set xlabel "Re_{b}" font "Roman,20"
set key top right
set ylabel "Eta" rotate by 0 font "Roman,20"
set title "{/Symbol h} v Re_b"
set log x
set yrange [0:1]


plot "steady_tavg_eta.dat" \
   i 0:2:2 u ($1/$2):12 pt 4 ps 2 lc rgb "black" title 'Steady',\
"stoch_tavg_eta.dat" \
   i 0:1 u ($1/$2):12 pt 9 ps 2 lc rgb "black" title 'Stochastic',\

} # end of block 1


# -------------------------------------------------------------

# Second Plot

perform_block_2 = 0

if (perform_block_2) {

set xlabel "Re_{b, eff}"
set key top right
set ylabel "Eta" rotate by 0 
set title "Using Effective Fr"
set log x
set yrange [0:1]

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 5 ps 2 lc rgb "green" title 'Steady Eta',\
"" i idx u (($8**3)*$1/$2):24 pt 5 ps 2 lc rgb "blue" title 'Steady Eta Lam',\
"" i idx u (($8**3)*$1/$2):28 pt 5 ps 2 lc rgb "red" title 'Steady Eta Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 7 ps 2 lc rgb "green" title 'Stoch. Eta',\
"" i idx u (($8**3)*$1/$2):24 pt 7 ps 2 lc rgb "blue" title 'Stoch. Eta Lam',\
"" i idx u (($8**3)*$1/$2):28 pt 7 ps 2 lc rgb "red" title 'Stoch. Eta Turb',\

} # end of block 2

# -------------------------------------------------------------

# Third Plot

perform_block_3 = 1

if (perform_block_3) {

set xlabel "Re_{b, eff}" font "Roman,20"
set key top right
set ylabel "Eta" rotate by 0 font "Roman,20"
set title "Using Effective Fr & {/Symbol w}_z"
set log x
set yrange [0:1]

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 4 ps 2 lc rgb "dark-violet" title 'Steady Eta',\
"" i idx u (($8**3)*$1/$2):32 pt 4 ps 2 lc rgb "blue" title 'Steady Eta_{Lam}',\
"" i idx u (($8**3)*$1/$2):36 pt 4 ps 2 lc rgb "red" title 'Steady Eta_{Turb}',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 9 ps 2 lc rgb "dark-violet" title 'Stoch. Eta',\
"" i idx u (($8**3)*$1/$2):32 pt 9 ps 2 lc rgb "blue" title 'Stoch. Eta_{Lam}',\
"" i idx u (($8**3)*$1/$2):36 pt 9 ps 2 lc rgb "red" title 'Stoch. Eta_{Turb}',\

} # end of block 3



