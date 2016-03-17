reset
set term png size 1920, 1080
set ylabel "cumulative probability--->"
set xlabel "--->"
set output "probability.png" 
set title "Plot of cumulative probability for 1000 random numbers"
plot "probability.txt" pt 7 ps 0.5 with lines