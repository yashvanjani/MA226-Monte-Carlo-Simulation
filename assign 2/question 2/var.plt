reset
set term png size 1920, 1080
set ylabel "variance--->"
set xlabel "Number of random numbers generated--->"
set output "var1.png" 
set title "Plot of variance for 1000 random numbers"
plot "var1.txt" pt 7 ps 0.5
set output "var2.png"
set title "Plot of variance for 10000 random numbers"
plot "var2.txt" pt 7 ps 0.4
set output "var3.png"
set title "Plot of variance for 100000 random numbers"
plot "var3.txt" pt 7 ps 0.3