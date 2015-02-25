#!usr/bin/perl
use warnings;
use strict;

my $array = [1, 2, 3, 4, 5];
my $scalar = 1;
my $hash = {'a' => 1,
	    'b' => 2,
	    'c' => 3
	    };

named_arguments({
		   'scalar' => $scalar,
		   'array' => $array,
		   'hash' => $hash
		   });




#takes in the passed_hash reference and prints out values stored in each key of the hash of references
sub named_arguments{
	my $sub_hash = $_[0]; 
	
	my $new_scalar = $sub_hash->{scalar};	#print scalar
	print "$new_scalar\n";
	
	my $new_array = $sub_hash->{array}; #print array
	print "@$new_array\n";
	
	my $new_hash = $sub_hash->{hash};	#prints the hash by getting the keys and running a loop through the referenced hash within the hash
	my @new_hash_keys = keys %$new_hash;
	foreach (@new_hash_keys){
		print "$new_hash->{$_} ";
	}
	print "\n";
}