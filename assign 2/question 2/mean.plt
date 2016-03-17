reset
set term png size 1920, 1080
set ylabel "mean--->"
set xlabel "Number of random numbers generated--->"
set output "mean1.png" 
set title "Plot of mean for 1000 random numbers"
plot "mean1.txt" pt 7 ps 0.5
set output "mean2.png"
set title "Plot of mean for 10000 random numbers"
plot "mean2.txt" pt 7 ps 0.4
set output "mean3.png"
set title "Plot of mean for 100000 random numbers"
plot "mean3.txt" pt 7 ps 0.3