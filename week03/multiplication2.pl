my @num1 = qw/1 2 3/;
my @num2 = qw/4 5 6/;

print "number 1: @num1\n";
print "number 2: @num2\n";

my $length1 = scalar @num1;
my $length2 = scalar @num2;

print multiplication(@num1,@num2), "\n";

sub multiplication {
	my @subtotals;
	my $subtotal;
	my $total = 0;
	my @num1 = splice @_, 0, $length1;
	my @num2 = splice @_, 0, $length2;
	
	my @num1reverse = reverse @num1;
	my @num2reverse = reverse @num2;
	
	for (my $i = 0; $i < $length1; $i++){
		my $multiplier = $num1reverse[$i]*(10**$i);
		
		for (my $j = 0; $j < $length2; $j++){
			my $multiplier2 = $num2reverse[$j]*(10**$j);
			$subtotal = $multiplier * $multiplier2;
			push @subtotals, $subtotal;
		}
	}
	
	foreach (@subtotals){
		$total = $_ + $total;
	}
	
	return $total;
}