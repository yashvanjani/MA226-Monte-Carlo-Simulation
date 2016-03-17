reset
set term png size 1920, 1080
set xlabel "u[i]--->"
set ylabel "u[i+1]--->"
set yrange [0:2147483648]
set xrange [0:2147483648]
set output "q2_graph1.png"
set title "2D-Plot of (u[i],u[i+1]) for 1000 random numbers"
plot "2d_plot1.txt" using 1:2
set output "q2_graph2.png"
set title "2D-Plot of (u[i],u[i+1]) for 10000 random numbers"
plot "2d_plot2.txt" using 1:2
set output "q2_graph3.png"
set title "2D-Plot of (u[i],u[i+1]) for 100000 random numbers"
plot "2d_plot3.txt" using 1:2
