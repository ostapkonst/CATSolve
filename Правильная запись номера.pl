open STDIN, "input.txt";
open STDOUT, "> output.txt";

@a = split "[ ()-]+", <>;

$b = 6 - length($a[1]);

print shift @a, " ", shift @a, " ";

$e = join "", @a;
$z = substr($e, $b, 2) . "-" . substr($e, $b+2, 2);

if ($b == 0) {
    print $z;
} else {
    print substr($e, 0, $b) . "-" . $z;
}

close STDIN;
close STDOUT;