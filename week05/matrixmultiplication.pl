#!usr/bin/perl
use warnings;
use strict;

my $a =[
	[1, 2],
	[3, 4],
	[5, 6]
	];

my $b = [
	[0, 1, 2],
	[3, 4, 5]
	];

my $x =[
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9],
	[10, 11, 12]
	];

my $y = [
	[0, 1, 2, 3],
	[4, 5, 6, 7],
	[8, 9, 10, 11]
	];

matrix_multiplication($a, $b);
print "\n";
matrix_multiplication($x, $y);



#create matrix based on rows and columns found in 2 matrices
#input: scalars: n, k, m
sub create_matrix {
	my $n = $_[0];	#length of row of mat1
	my $k = $_[1];	
	my $m = $_[2];	# $k is length of row in mat2
	
	my $c = [];	#initialize matrix, c
	
	for (my $i = 0; $i < $n; $i++ ){	#create the output array, set all values to 0
		$c->[$i] = [];		#initializes each element to array reference
		for (my $j = 0; $j < $m; $j++){
			$c->[$i]->[$j] = 0;	#initialize each element of array reference to another array reference
		}
	}
	return $c;
}

#main function that will carry out matrix multiplication
sub matrix_multiplication {
	my $mat1 = $_[0];
	my $mat2 = $_[1];
	my $n = scalar @$mat1;	#length of row of mat1
	my $k = $mat1->[0];	
	$k = scalar @$k;	#length of column of mat1
	my $m = $mat2->[0];
	$m = scalar @$m;
	
	my $c = create_matrix($n, $k, $m);
	
	for (my $i = 0; $i < $n; $i++ ){	
		for (my $j = 0; $j < $m; $j++){
			for (my $l = 0; $l < $k; $l++){
				
			$c->[$i]->[$j] += $mat1->[$i]->[$l] * $mat2->[$l]->[$j];
			} 	
		}
	}
	
	foreach (@$c){		#prints out matrix c after multiplication of mat1 and 2
		foreach (@$_){
			print "$_\t";
		}
		print "\n";
	}
}