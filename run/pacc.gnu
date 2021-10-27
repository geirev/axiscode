#!/usr/bin/gnuplot -persist
#
#
#    	G N U P L O T
#    	Version 5.2 patchlevel 2    last modified 2017-11-01
#
#    	Copyright (C) 1986-1993, 1998, 2004, 2007-2017
#    	Thomas Williams, Colin Kelley and many others
#
#    	gnuplot home:     http://www.gnuplot.info
#    	faq, bugs, etc:   type "help FAQ"
#    	immediate help:   type "help"  (plot window: hit 'h')
# set terminal qt 0 font "Sans,9"
# set output
unset clip points
set clip one
unset clip two
set errorbars front 1.000000
set border 31 front lt black linewidth 1.000 dashtype solid
set zdata
set ydata
set xdata
set y2data
set x2data
set boxwidth
set style fill  empty border
set style rectangle back fc  bgnd fillstyle   solid 1.00 border lt -1
set style circle radius graph 0.02
set style ellipse size graph 0.05, 0.03 angle 0 units xy
set dummy x, y
set format x "% h"
set format y "% h"
set format x2 "% h"
set format y2 "% h"
set format z "% h"
set format cb "% h"
set format r "% h"
set ttics format "% h"
set timefmt "%d/%m/%y,%H:%M"
set angles radians
set tics back
set grid nopolar
set grid xtics nomxtics ytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linecolor 0 linewidth 0.500,  lt 0 linecolor 0 linewidth 0.500
unset raxis
set theta counterclockwise right
set style parallel front  lt black linewidth 2.000 dashtype solid
set key title "" center
set key fixed right top vertical Right noreverse enhanced autotitle nobox
set key noinvert samplen 4 spacing 1 width 0 height 0
set key maxcolumns 0 maxrows 0
set key noopaque
unset label
unset arrow
set style increment default
unset style line
unset style arrow
set style histogram clustered gap 2 title textcolor lt -1
unset object
set style textbox transparent margins  1.0,  1.0 border  lt -1 linewidth  1.0
set offsets 0, 0, 0, 0
set pointsize 1
set pointintervalbox 1
set encoding default
unset polar
unset parametric
unset decimalsign
unset micro
unset minussign
set view 60, 30, 1, 1
set view azimuth 0
set rgbmax 255
set samples 100, 100
set isosamples 10, 10
set surface
unset contour
set cntrlabel  format '%8.3g' font '' start 5 interval 20
set mapping cartesian
set datafile separator whitespace
unset hidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam levels auto 5
set cntrparam points 5
set size ratio 0 1,1
set origin 0,0
set style data points
set style function lines
unset xzeroaxis
unset yzeroaxis
unset zzeroaxis
unset x2zeroaxis
unset y2zeroaxis
set xyplane relative 0.5
set tics scale  1, 0.5, 1, 1, 1
set mxtics default
set mytics default
set mztics default
set mx2tics default
set my2tics default
set mcbtics default
set mrtics default
set nomttics
set xtics border in scale 1,0.5 mirror norotate  autojustify
set xtics  norangelimit autofreq
set ytics border in scale 1,0.5 mirror norotate  autojustify
set ytics  norangelimit autofreq
set ztics border in scale 1,0.5 nomirror norotate  autojustify
set ztics  norangelimit autofreq
unset x2tics
unset y2tics
set cbtics border in scale 1,0.5 mirror norotate  autojustify
set cbtics  norangelimit autofreq
set rtics axis in scale 1,0.5 nomirror norotate  autojustify
set rtics  norangelimit autofreq
unset ttics
set title ""
set title  font "" norotate
set timestamp bottom
set timestamp ""
set timestamp  font "" norotate
set trange [ * : * ] noreverse nowriteback
set urange [ * : * ] noreverse nowriteback
set vrange [ * : * ] noreverse nowriteback
set xlabel ""
set xlabel  font "" textcolor lt -1 norotate
set x2label ""
set x2label  font "" textcolor lt -1 norotate
set xrange [ 453.072 : 843.697 ] noreverse nowriteback
set x2range [ 472.098 : 828.543 ] noreverse nowriteback
set ylabel ""
set ylabel  font "" textcolor lt -1 rotate
set y2label ""
set y2label  font "" textcolor lt -1 rotate
set yrange [ -193.202 : 119.298 ] noreverse nowriteback
set y2range [ -142.597 : 103.946 ] noreverse nowriteback
set zlabel ""
set zlabel  font "" textcolor lt -1 norotate
set zrange [ * : * ] noreverse nowriteback
set cblabel ""
set cblabel  font "" textcolor lt -1 rotate
set cbrange [ * : * ] noreverse nowriteback
set rlabel ""
set rlabel  font "" textcolor lt -1 norotate
set rrange [ * : * ] noreverse nowriteback
unset logscale
unset jitter
set zero 1e-08
set lmargin  -1
set bmargin  -1
set rmargin  -1
set tmargin  -1
set locale "nb_NO.UTF-8"
set pm3d explicit at s
set pm3d scansautomatic
set pm3d interpolate 1,1 flush begin noftriangles noborder corners2color mean
set pm3d nolighting
set palette positive nops_allcF maxcolors 0 gamma 1.5 color model RGB
set palette rgbformulae 7, 5, 15
set colorbox default
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault
set style boxplot candles range  1.50 outliers pt 7 separation 1 labels auto unsorted
set loadpath
set fontpath
set psdir
set fit brief errorvariables nocovariancevariables errorscaling prescale nowrap v5
GNUTERM = "qt"
x = 0.0
pack( r, g, b ) = 2**16*r + 2**8*g + b
set key noautotitle
set size 1.0, 1.0
## Last datafile plotted: "test.dat"
#003f5c
#bc5090
#ffa600
set style line  1 linewidth 2 linecolor rgb '#003f5c'        pointsize 0.75 pointtype 6 pointinterval 2
set style line  2 linewidth 2 linecolor rgb '#bc5090'        pointsize 0.75 pointtype 6 pointinterval 2
set style line  3 linewidth 2 linecolor rgb '#ffa600'        pointsize 0.75 pointtype 6 pointinterval 2
set style line  4 linewidth 2 linecolor rgb '#888888'        pointsize 0.75 pointtype 6 pointinterval 2
set style line  5 linewidth 2 linecolor rgb pack(117,112,179) pointsize 0.75 pointtype 6 pointinterval 2
set style line  6 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
set style line  7 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
set style line  8 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
set style line  9 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
set style line 10 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
set style line 11 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
set style line 12 linewidth 2 linecolor rgb pack(231,41,138) pointsize 0.75 pointtype 6 pointinterval 2
#set style line linecolor rgb pack(117,112,179)   # 27 dark blue
set autoscale
set style data lines
#
#   1         2        3         4         5         6         7         8         9        10        11        12        13        14        15        16        17        18        19        20        21        22        23        24        25        26
# ind distance2   pos1(x) 2 pos1(y)   pos1(z)   pos2(x)   pos2(y)   pos2(z)    ed1(x)    ed1(y)    ed1(z)    ed9(x)    ed9(y)    ed9(z)    ee6(x)    ee6(y)    ee6(z)    efa(x)    efa(y)    efa(z)    eff(x)    eff(y)    eff(z)    f00(x)    f00(y)    f00(z)
participant="65"
direction="03"
speed="2"
plot participant."_".direction."_".speed.".out"  using 2:9  linestyle 1 title "ed1x",\
     participant."_".direction."_".speed.".out"  using 2:10 linestyle 2 title "ed1y",\
     participant."_".direction."_".speed.".out"  using 2:11 linestyle 3 title "ed1z",\
     participant."_".direction."_".speed.".out"  using 2:27 linestyle 4 title "speed"
pause -1

plot participant."_".direction."_".speed.".out"  using 2:12 linestyle 1 title "ed9x",\
     participant."_".direction."_".speed.".out"  using 2:13 linestyle 2 title "ed9y",\
     participant."_".direction."_".speed.".out"  using 2:14 linestyle 3 title "ed9z",\
     participant."_".direction."_".speed.".out"  using 2:27 linestyle 4 title "speed"
pause -1

plot participant."_".direction."_".speed.".out"  using 2:15 linestyle 1 title "ee6x",\
     participant."_".direction."_".speed.".out"  using 2:16 linestyle 2 title "ee6y",\
     participant."_".direction."_".speed.".out"  using 2:17 linestyle 3 title "ee6z",\
     participant."_".direction."_".speed.".out"  using 2:27 linestyle 4 title "speed"
pause -1

plot participant."_".direction."_".speed.".out"  using 2:18 linestyle 1 title "efax",\
     participant."_".direction."_".speed.".out"  using 2:19 linestyle 2 title "efay",\
     participant."_".direction."_".speed.".out"  using 2:20 linestyle 3 title "efaz",\
     participant."_".direction."_".speed.".out"  using 2:27 linestyle 4 title "speed"
pause -1

plot participant."_".direction."_".speed.".out"  using 2:21 linestyle 1 title "effx",\
     participant."_".direction."_".speed.".out"  using 2:22 linestyle 2 title "effy",\
     participant."_".direction."_".speed.".out"  using 2:23 linestyle 3 title "effz",\
     participant."_".direction."_".speed.".out"  using 2:27 linestyle 4 title "speed"
pause -1

plot participant."_".direction."_".speed.".out"  using 2:24 linestyle 1 title "f00x",\
     participant."_".direction."_".speed.".out"  using 2:25 linestyle 2 title "f00y",\
     participant."_".direction."_".speed.".out"  using 2:26 linestyle 3 title "f00z",\
     participant."_".direction."_".speed.".out"  using 2:27 linestyle 4 title "speed"
pause -1
