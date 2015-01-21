#!usr/bin/perl
use strict;
use warnings;

# subroutine that takes an array of numbers and returns the largest value in it
# it will be able to handle any length of array

my @input = qw/1  2 3 4 5 6 7 10 22 15 12 50 23/;
my @input2 = (1, "a", 3, 3, "x");
print (largestnum(@input));
print "\n";
print &largestnum(@input);
print "\n";      #same as "return" in subroutine, returns last executed command

print (find("3", @input2));
print "\n";

sub largestnum {        #finds largest number in the array
    my @array = @_;
    my $largest = $_[0];
    foreach (@array){
        if ($largest < $_) {
            $largest = $_;
        }
    }
    return $largest;
}

sub find {          #takes scalar and an array, returns 1 if scalar is found in the array
    my $num = $_[0];
    my @array = @_;
    shift @array;
    my $found = 0;
    my $arraylength = length @array;
    
        foreach (@array) {
            if ($num eq $_) {
                $found = 1;
            }
        }
    
    return $found;
}