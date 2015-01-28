#!usr/bin/perl
use strict;
use warnings;

my @startarray = qw/ 1 2 3 4 5 6 7 8 9 10 11 20 23 28 29 33 56 83 /;
print "@startarray \n";
my $num = <STDIN>;
if (binarysearch($num, @startarray) == 1) {
    print "number found\n";
} else {
    print "number not found\n";
}



sub binarysearch {
    my @haystack = @_;
    my $needle = shift @haystack;
    my $length = scalar @haystack;
    
    if ($length == 0) {
        return 0;
        
    } elsif ($haystack[$length/2] == $needle) {
        return 1;
        
    } elsif ($haystack[$length/2] > $needle){
        splice @haystack, ($length+1)/2;
        return binarysearch($needle, @haystack);
        
    } elsif ($haystack[$length/2] < $needle) {
        splice @haystack, 0, ($length+1)/2;
        return binarysearch($needle, @haystack);
    }
    
}