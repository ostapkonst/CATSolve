open STDIN, "input.txt";
open STDOUT, "> output.txt";

chomp(@ip = <>);

sub permutations {
	return ([]) unless my $n = shift;
	my @permutations;
	for(permutations($n - 1)) {
		for(my $i = 0; $i < $n; $i++) {
			my @p = @$_;
			splice @p, $i, 0, $n;
			push @permutations, \@p;
		}
	}
	return @permutations;
}

@a  = permutations(4);

for ($i = 0; $i < 24; ++$i) {
	$s = "$ip[$a[$i][0]-1]$ip[$a[$i][1]-1]$ip[$a[$i][2]-1]$ip[$a[$i][3]-1]";
	$ips{$s} = "" if $s =~'^([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$';
}

print "$_\n" for (sort keys %ips);

close STDIN;
close STDOUT;