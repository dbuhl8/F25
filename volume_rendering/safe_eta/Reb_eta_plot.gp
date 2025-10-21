reset
set multiplot layout 1,3 columnsfirst 

idx = 0


# -------------------------------------------------------------

# First Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "Eta" rotate by 0 
set title "Normal"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 5 ps 2 lc rgb "green" title 'Steady Eta',\
"" i idx u (($8**3)*$1/$2):16 pt 5 ps 2 lc rgb "blue" title 'Steady Eta Lam',\
"" i idx u (($8**3)*$1/$2):20 pt 5 ps 2 lc rgb "red" title 'Steady Eta Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 7 ps 2 lc rgb "green" title 'Stoch. Eta',\
"" i idx u (($8**3)*$1/$2):16 pt 7 ps 2 lc rgb "blue" title 'Stoch. Eta Lam',\
"" i idx u (($8**3)*$1/$2):20 pt 7 ps 2 lc rgb "red" title 'Stoch. Eta Turb',\


# -------------------------------------------------------------

# Second Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "Eta" rotate by 0 
set title "Using Effective Fr"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 5 ps 2 lc rgb "green" title 'Steady Eta',\
"" i idx u (($8**3)*$1/$2):24 pt 5 ps 2 lc rgb "blue" title 'Steady Eta Lam',\
"" i idx u (($8**3)*$1/$2):28 pt 5 ps 2 lc rgb "red" title 'Steady Eta Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 7 ps 2 lc rgb "green" title 'Stoch. Eta',\
"" i idx u (($8**3)*$1/$2):24 pt 7 ps 2 lc rgb "blue" title 'Stoch. Eta Lam',\
"" i idx u (($8**3)*$1/$2):28 pt 7 ps 2 lc rgb "red" title 'Stoch. Eta Turb',\


# -------------------------------------------------------------

# Third Plot

set xlabel "Re_{b, eff}"
set key top right
set ylabel "Eta" rotate by 0 
set title "Using Effective Fr & {\Symbol w}_z"

plot "steady_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 5 ps 2 lc rgb "green" title 'Steady Eta',\
"" i idx u (($8**3)*$1/$2):32 pt 5 ps 2 lc rgb "blue" title 'Steady Eta Lam',\
"" i idx u (($8**3)*$1/$2):36 pt 5 ps 2 lc rgb "red" title 'Steady Eta Turb',\
"stoch_tavg_eta.dat" \
   i idx u (($8**3)*$1/$2):12 pt 7 ps 2 lc rgb "green" title 'Stoch. Eta',\
"" i idx u (($8**3)*$1/$2):32 pt 7 ps 2 lc rgb "blue" title 'Stoch. Eta Lam',\
"" i idx u (($8**3)*$1/$2):36 pt 7 ps 2 lc rgb "red" title 'Stoch. Eta Turb',\


