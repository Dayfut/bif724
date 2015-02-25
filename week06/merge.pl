#!usr/bin/perl
use strict;
use warnings;


#sub merge{
#    my $array1 = $_[0];
#    my $array2 = $_[1];
#    my $newarray = $_[2];
#    
#    if (@$array1 and @$array2) {
#        if (($array1->[0] <= $array2->[0])) {
#            push @$newarray, (shift @$array1);
#            return merge($array1, $array2, $newarray);
#    }   else {
#            push @$newarray, (shift @$array2);
#            return merge($array1, $array2, $newarray); 
#        }
#    }
#    push @$newarray, @$array1;
#    push @$newarray, @$array2;
#
#    return @$newarray;
#}
#print join (" ", merge([1,3,4,6,7,8], [2,5,9,10])), "\n";


#THESE WORK :D
sub merge2{
    my $array1 = $_[0];
    my $array2 = $_[1];
    my @newarray;
    
    while (@$array1 and @$array2) {
        if ($array1->[0] < $array2->[0]) {
            push @newarray, (shift @$array1);
        } else {
            push @newarray, (shift @$array2);
        }
    }
    push @newarray, @$array1;
    push @newarray, @$array2;

    return @newarray;    
}


print join (" ", merge2([1,3,4,6,7,8], [2,5,9,10])), "\n";