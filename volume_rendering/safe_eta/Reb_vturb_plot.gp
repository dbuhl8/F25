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

#if (0) {

#set xlabel "Re_{b, eff}"
#set key top right
#set ylabel "Eta" rotate by 0 
#set title "Normal"
#set log x
#set yrange[0:1]

#plot "steady_tavg_eta.dat" \
 #i idx u (($8**3)*$1/$2):38 pt 5 ps 2 lc rgb "red" title 'Steady VTurb',\
#"stoch_tavg_eta.dat" \
 #i idx u (($8**3)*$1/$2):38 pt 7 ps 2 lc rgb "red" title 'Stoch. VTurb',\
# i idx u (($8**3)*$1/$2):37 pt 7 ps 2 lc rgb "blue" title 'Stoch. VLam',\
# i idx u (($8**3)*$1/$2):37 pt 5 ps 2 lc rgb "blue" title 'Steady VLam',\

#}


# -------------------------------------------------------------

# Second Plot

#if (0) {

#set xlabel "Re_{b, eff}"
#set key top right
#set ylabel "Eta" rotate by 0 
#set title "Using Effective Fr"
#set log x
#set yrange[0:1]

#plot "steady_tavg_eta.dat" \
 #i idx u (($8**3)*$1/$2):40 pt 5 ps 2 lc rgb "red" title 'Steady VTurb',\
#"stoch_tavg_eta.dat" \
 #i idx u (($8**3)*$1/$2):40 pt 7 ps 2 lc rgb "red" title 'Stoch. VTurb',\
# i idx u (($8**3)*$1/$2):39 pt 7 ps 2 lc rgb "blue" title 'Stoch. VLam',\
# i idx u (($8**3)*$1/$2):39 pt 5 ps 2 lc rgb "blue" title 'Steady VLam',\

#} 

# -------------------------------------------------------------

# Third Plot

perform_block_3 = 0

if (perform_block_3) {


set xlabel "Re_{b, eff}"
set key top right
#set ylabel "Eta" rotate by 0 
#set title "Using Effective Fr & {/Symbol w}_z"
set log x
set yrange[0:1]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u (($8**3)*$1/$2):38 pt 4 ps 2 lc rgb "red" title 'Steady VTurb',\
"" i 0:2:2 u (($8**3)*$1/$2):42 pt 4 ps 2 lc rgb "green" title 'Steady VTurb_{Fr,vortz}',\
"stoch_tavg_eta.dat" \
   i 0:1 u (($8**3)*$1/$2):38 pt 9 ps 2 lc rgb "red" title 'Stoch. VTurb',\
"" i 0:1 u (($8**3)*$1/$2):42 pt 9 ps 2 lc rgb "green" title 'Stoch. VTurb{Fr,vortz}'

#"" i 0:2:2 u (($8**3)*$1/$2):40 pt 4 ps 2 lc rgb "blue" title 'Steady VTurb_{Fr}',\
#"" i 0:1 u (($8**3)*$1/$2):40 pt 9 ps 2 lc rgb "blue" title 'Stoch. VTurb_{Fr}',\

}


# -------------------------------------------------------------

# Fourth Plot

perform_block_4 = 1

if (perform_block_4) {


set xlabel "Vturb_{old}"
set key top right
set ylabel "VTurb_{new,eff}" rotate by 0 
set yrange[0:1]

plot "steady_tavg_eta.dat" \
   i 0:2:2 u 38:42 pt 4 ps 2 lc rgb "red" title 'Steady VTurb',\
"stoch_tavg_eta.dat" \
   i 0:1 u 38:42 pt 9 ps 2 lc rgb "red" title 'Stoch. VTurb',\
   x

}
