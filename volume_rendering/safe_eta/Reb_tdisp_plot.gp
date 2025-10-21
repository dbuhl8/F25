reset
set multiplot layout 1,3 columnsfirst 

idx = 0


# -------------------------------------------------------------

# First Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "TDisp" rotate by 0 
set title "Normal"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):9 pt 5 ps 2 lc rgb "green" title 'Steady TDisp',\
"" i idx u (($8**3)*$1/$2):13 pt 5 ps 2 lc rgb "blue" title 'Steady TDisp Lam',\
"" i idx u (($8**3)*$1/$2):17 pt 5 ps 2 lc rgb "red" title 'Steady TDisp Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):9 pt 7 ps 2 lc rgb "green" title 'Stoch. TDisp',\
"" i idx u (($8**3)*$1/$2):13 pt 7 ps 2 lc rgb "blue" title 'Stoch. TDisp Lam',\
"" i idx u (($8**3)*$1/$2):17 pt 7 ps 2 lc rgb "red" title 'Stoch. TDisp Turb',\


# -------------------------------------------------------------

# Second Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "TDisp" rotate by 0 
set title "Using Effective Fr"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):9 pt 5 ps 2 lc rgb "green" title 'Steady TDisp',\
"" i idx u (($8**3)*$1/$2):21 pt 5 ps 2 lc rgb "blue" title 'Steady TDisp Lam',\
"" i idx u (($8**3)*$1/$2):25 pt 5 ps 2 lc rgb "red" title 'Steady TDisp Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):9 pt 7 ps 2 lc rgb "green" title 'Stoch. TDisp',\
"" i idx u (($8**3)*$1/$2):21 pt 7 ps 2 lc rgb "blue" title 'Stoch. TDisp Lam',\
"" i idx u (($8**3)*$1/$2):25 pt 7 ps 2 lc rgb "red" title 'Stoch. TDisp Turb',\


# -------------------------------------------------------------

# Third Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "TDisp" rotate by 0 
set title "Using Effective Fr & {/Symbol w}_z"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):9 pt 5 ps 2 lc rgb "green" title 'Steady TDisp',\
"" i idx u (($8**3)*$1/$2):29 pt 5 ps 2 lc rgb "blue" title 'Steady TDisp Lam',\
"" i idx u (($8**3)*$1/$2):33 pt 5 ps 2 lc rgb "red" title 'Steady TDisp Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):9 pt 7 ps 2 lc rgb "green" title 'Stoch. TDisp',\
"" i idx u (($8**3)*$1/$2):29 pt 7 ps 2 lc rgb "blue" title 'Stoch. TDisp Lam',\
"" i idx u (($8**3)*$1/$2):33 pt 7 ps 2 lc rgb "red" title 'Stoch. TDisp Turb',\


