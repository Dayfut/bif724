#!usr/bin/perl
use warnings;
use strict;


sub linear_search { #takes a scalar, array reference, and function reference
    my $needle = shift; #the scalar
    my $haystack = shift;   #the reference to the array
    my $equals = shift;     #the reference to the function
    
    foreach my $element (@$haystack){       #foreach element in array
        if ($equals -> ($needle, $element)){    #if function returns true, return 1
            return 1;
        }
    }
    return;
}

my $divisible = sub {       #finds if number is divisible by factor
  my $factor = shift;
  my $number = shift;
  return ($number % $factor) == 0;
};



my $array = [1, 2, 3, 4, 5, 6];

my $result = linear_search(1, $array, sub {return $_[0] == $_[1];} );   #the equals function is passed anonymously
print "$result\n";

#my $array2 = [1, 3, 5, 7, 9, 11];                  #cant get to work
#$result = linear_search(2, $array2, $divisible);
#print "$result\n";