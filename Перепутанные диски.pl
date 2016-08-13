open STDIN, "input.txt";
open STDOUT, "> output.txt";

$n = <>;

@d = <>;
chomp(@d);

%b = map{$_ => $_} @d;

for $g(@d) { 
	if ($drive ne "") {
		$b{$drive} = $b{$g};
	}
	$drive = $g; 
	$b{$g} = "*"; 
}
 
for $g(keys %b) {
	print $g . " - " . $b{$g} . "\n"; 
}

close STDIN;
close STDOUT;