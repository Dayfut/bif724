#!usr/bin/perl
use strict;
use warnings;

# subroutine that takes an array of numbers and returns the largest value in it
# it will be able to handle any length of array

my @input = qw/1  2 3 4 5 6 7 10 22 15 12 50 23/;
print (largestnum(@input));

sub largestnum {        #finds largest number in the array
    my @input = @_;
    my $largest = $_[0];
    foreach (@input){
        if ($largest < $_) {
            $largest = $_;
        }
    }
    return $largest;
}