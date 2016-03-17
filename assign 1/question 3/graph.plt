reset
set term png size 1920, 1080
set output "q3_graph.png"
set xlabel "u[i-1]--->"
set ylabel "u[i]--->"
set title "2D-Plot of (u[i-1],u[i]) for 1000 random numbers"
plot "output.txt" using 1:2
