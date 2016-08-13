open STDIN, "input.txt";
open STDOUT, "> output.txt";

($n, $m) = split " ", <>;

$p = $n * ($n - 1) * ($n - 2);
$p0 = ($n - $m) * ($n - $m - 1) * ($n - $m - 2) / $p;
$p1 = ($n - $m) * ($n - $m - 1) * $m * 3 / $p;
$p2 = ($n - $m) * ($m - 1) * $m * 3 / $p;
$p3 = ($m - 1) * ($m - 2) * $m / $p; 

print join " ", ($p0,$p1,$p2,$p3);

close STDIN;
close STDOUT; 