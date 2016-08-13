open STDIN, "input.txt";
open STDOUT, "> output.txt";

$age = int((<> + 99) / 100);

if ($age >= 10) {
	$century .= "X" x ($age / 10);
	$age %= 10;
}
if ($age == 9) {
	$century .= "IX";
} elsif ($age == 4) {
	$century .= "IV";
} elsif ($age > 0) {
	$century .= "V" x ($age / 5) . "I" x ($age % 5); 
}

print $century;

close STDIN;
close STDOUT;