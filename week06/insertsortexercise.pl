#!usr/bin/perl
use strict;
use warnings;

#input: an array1
#
#declare a new empty array2
#
#for each element in array1,
#    add in the element of array1 if array2 is empty
#    if array2 is not empty,
#        if element is less than first index, add to [0] index
#        if element is greater than last index, add to end of array2
#        for each element in array2,
#            if element from array1 is greater than previous index and less than next index, insert element into that index

sub my_sort{
    my @array1 = @_;
    #my @array2 = (shift @array1);
    my @array2 = ();
    
    foreach my $array1num (@array1){
        my $i = 0;
        while ($i < @array2 && $array1num > $array2[$i]) {
          $i++;
        }
        splice @array2, $i, 0, $array1num;  
    }
    return @array2;
}

my @testarray = qw/3 5 2 4 1 10 5 2 5 6 2 3 9 8/;
print "@testarray\n";
print join(" ", my_sort(@testarray)), "\n";


