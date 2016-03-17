reset
set term png size 1920, 1080
set style fill solid
set boxwidth 0.5
set yrange [0:260]
set xlabel "u[i]--->"
set ylabel "frequency--->"
set title "For a=1597, b=0, m=244944, n=5000:"
set output "plot3.png"
plot "output3.txt" using 1:3:xtic(2) with boxes
