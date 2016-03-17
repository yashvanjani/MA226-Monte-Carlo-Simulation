reset
set term png size 1920, 1080
set style fill solid
set boxwidth 0.5
set yrange [0:2600]
set xlabel "u[i]--->"
set ylabel "frequency--->"
set title "For a=1597, b=0, m=244944, n=50000:"
set output "plot4.png"
plot "output4.txt" using 1:3:xtic(2) with boxes
