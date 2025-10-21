reset
set multiplot layout 1,3 columnsfirst 

idx = 0


# -------------------------------------------------------------

# First Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "MDisp" rotate by 0 
set title "Normal"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):10 pt 5 ps 2 lc rgb "green" title 'Steady MDisp',\
"" i idx u (($8**3)*$1/$2):14 pt 5 ps 2 lc rgb "blue" title 'Steady MDisp Lam',\
"" i idx u (($8**3)*$1/$2):18 pt 5 ps 2 lc rgb "red" title 'Steady MDisp Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):10 pt 7 ps 2 lc rgb "green" title 'Stoch. MDisp',\
"" i idx u (($8**3)*$1/$2):14 pt 7 ps 2 lc rgb "blue" title 'Stoch. MDisp Lam',\
"" i idx u (($8**3)*$1/$2):18 pt 7 ps 2 lc rgb "red" title 'Stoch. MDisp Turb',\


# -------------------------------------------------------------

# Second Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "MDisp" rotate by 0 
set title "Using Effective Fr"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):10 pt 5 ps 2 lc rgb "green" title 'Steady MDisp',\
"" i idx u (($8**3)*$1/$2):22 pt 5 ps 2 lc rgb "blue" title 'Steady MDisp Lam',\
"" i idx u (($8**3)*$1/$2):26 pt 5 ps 2 lc rgb "red" title 'Steady MDisp Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):10 pt 7 ps 2 lc rgb "green" title 'Stoch. MDisp',\
"" i idx u (($8**3)*$1/$2):22 pt 7 ps 2 lc rgb "blue" title 'Stoch. MDisp Lam',\
"" i idx u (($8**3)*$1/$2):26 pt 7 ps 2 lc rgb "red" title 'Stoch. MDisp Turb',\


# -------------------------------------------------------------

# Third Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "MDisp" rotate by 0 
set title "Using Effective Fr & {\Symbol w}_z"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):10 pt 5 ps 2 lc rgb "green" title 'Steady MDisp',\
"" i idx u (($8**3)*$1/$2):30 pt 5 ps 2 lc rgb "blue" title 'Steady MDisp Lam',\
"" i idx u (($8**3)*$1/$2):34 pt 5 ps 2 lc rgb "red" title 'Steady MDisp Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):10 pt 7 ps 2 lc rgb "green" title 'Stoch. MDisp',\
"" i idx u (($8**3)*$1/$2):30 pt 7 ps 2 lc rgb "blue" title 'Stoch. MDisp Lam',\
"" i idx u (($8**3)*$1/$2):34 pt 7 ps 2 lc rgb "red" title 'Stoch. MDisp Turb',\


