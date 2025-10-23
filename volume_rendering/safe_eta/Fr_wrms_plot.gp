reset
#set multiplot layout 3,1 columnsfirst 

idx = 0


# -------------------------------------------------------------

# First Plot

set xlabel "Fr^{-1}"
set key top right
#set ylabel "Eta" rotate by 0 
set title "Normal"
set log xy

plot "steady_tavg_eta.dat" \
   i idx u (($2**0.5)/$8):($42*(($2**0.5)/$8)**-0.5 + 1.9*$41*(($2**0.5)/$8)**-1) pt 5 ps 2 lc rgb "red" title 'Steady Wrms (reconstructed)',\
"stoch_tavg_eta.dat" \
   i idx u (($2**0.5)/$8):($42*(($2**0.5)/$8)**-0.5 + 1.9*$41*(($2**0.5)/$8)**-1) pt 7 ps 2 lc rgb "blue" title 'Stoch. Wrms (reconstructed)'

#"" i idx u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "black" title 'Steady Wrms',\
#"" i idx u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "black" title 'Steady Wrms',\


#plot "steady_tavg_eta.dat" \
#   i idx u ($2**0.5):43 pt 5 ps 2 lc rgb "magenta" title 'Steady Wrms',\
#"" i idx u ($2**0.5):50 pt 5 ps 2 lc rgb "red" title 'Steady Wlam',\
#"" i idx u ($2**0.5):51 pt 5 ps 2 lc rgb "blue" title 'Steady Wturb',\
#"stoch_tavg_eta.dat" \
#   i idx u ($2**0.5):43 pt 7 ps 2 lc rgb "magenta" title 'Stoch. Wrms',\
#"" i idx u ($2**0.5):50 pt 7 ps 2 lc rgb "red" title 'Stoch. Wlam',\
#"" i idx u ($2**0.5):51 pt 7 ps 2 lc rgb "blue" title 'Stoch. Wturb'


# -------------------------------------------------------------

# Second Plot

#set xlabel "Fr_{eff}^{-1}"
#set key top right
#set ylabel "Eta" rotate by 0 
#set title "Using Effective Fr"
#set log x

#plot "steady_tavg_eta.dat" \
#   i idx u (($2**0.5)/$8):($38*x**-0.5 + 1.9*$37*x**-1) pt 5 ps 2 lc rgb "green" title 'Steady Wrms (reconstructed)',\
#"" i idx u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "black" title 'Steady Wrms',\
#"stoch_tavg_eta.dat" \
#   i idx u (($2**0.5)/$8):($38*x**-0.5 + 1.9*$37*x**-1) pt 5 ps 2 lc rgb "green" title 'Steady Wrms (reconstructed)',\
#"" i idx u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "black" title 'Steady Wrms',\


#plot "steady_tavg_eta.dat" \
#   i idx u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "magenta" title 'Steady Wrms',\
#"" i idx u (($2**0.5)/$8):50 pt 5 ps 2 lc rgb "red" title 'Steady Wlam',\
#"" i idx u (($2**0.5)/$8):51 pt 5 ps 2 lc rgb "blue" title 'Steady Wturb',\
#"stoch_tavg_eta.dat" \
#   i idx u (($2**0.5)/$8):43 pt 7 ps 2 lc rgb "magenta" title 'Stoch. Wrms',\
#"" i idx u (($2**0.5)/$8):50 pt 7 ps 2 lc rgb "red" title 'Stoch. Wlam',\
#"" i idx u (($2**0.5)/$8):51 pt 7 ps 2 lc rgb "blue" title 'Stoch. Wturb',\


# -------------------------------------------------------------

# Third Plot

#set xlabel "Fr_{eff}^{-1}"
#set key top right
#set ylabel "Eta" rotate by 0 
#set title "Using Effective Fr & w"
#set log x

#plot "steady_tavg_eta.dat" \
#   i idx u (($2**0.5)/$8):43 pt 5 ps 2 lc rgb "magenta" title 'Steady Wrms',\
#"" i idx u (($2**0.5)/$8):52 pt 5 ps 2 lc rgb "red" title 'Steady Wlam',\
#"" i idx u (($2**0.5)/$8):53 pt 5 ps 2 lc rgb "blue" title 'Steady Wturb',\
#"stoch_tavg_eta.dat" \
#   i idx u (($2**0.5)/$8):43 pt 7 ps 2 lc rgb "magenta" title 'Stoch. Wrms',\
#"" i idx u (($2**0.5)/$8):52 pt 7 ps 2 lc rgb "red" title 'Stoch. Wlam',\
#"" i idx u (($2**0.5)/$8):53 pt 7 ps 2 lc rgb "blue" title 'Stoch. Wturb',\

