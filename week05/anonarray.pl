#!usr/bin/perl
use warnings;
use strict;

#create an anonymous array

my @array = qw/1 a x x 3/;
my $named_ar_ref = \@array;	#named array reference
my $ar_ref = [1, 'a', 'x', 'x', 3]; #anonymous array, only gives memory address, uses [] instead of ()

print "$ar_ref\n";
print "@$ar_ref\n";

#anonymous hashes can be created in the same way, with {} instead of ()



