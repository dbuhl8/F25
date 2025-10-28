reset
#set multiplot layout 3,1 columnsfirst 

idx = 0


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

set xlabel "Re_{b, eff}"
set key top right
#set ylabel "Eta" rotate by 0 
set title "Using Effective Fr & {/Symbol w}_z"
set log x
set yrange[0:1]

plot "steady_tavg_eta.dat" \
 i idx u (($8**3)*$1/$2):42 pt 5 ps 2 lc rgb "red" title 'Steady VTurb',\
"stoch_tavg_eta.dat" \
 i idx u (($8**3)*$1/$2):42 pt 7 ps 2 lc rgb "red" title 'Stoch. VTurb',\
# i idx u (($8**3)*$1/$2):41 pt 5 ps 2 lc rgb "blue" title 'Steady Eta Lam',\
# i idx u (($8**3)*$1/$2):41 pt 7 ps 2 lc rgb "blue" title 'Stoch. VLam',\
