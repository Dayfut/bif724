#!usr/bin/perl
use warnings;
use strict;

#Author: David Cheung
#Date: Feb 18, 2015

#input: hash reference, containing key-value pairs of a number and an array reference
#output: scalar, index of the first matched number in the array OR nothing if no match
sub linear_search { #takes a scalar, array reference, and function reference
    my $hash = $_[0];           #hash reference
    my $num = $hash->{value};   #number to be searched for
    my $array = $hash->{array}; #array reference
    my $index = 0;              #index counter
    
    foreach (@$array){          #looks through array and returns index value if match is found
        if ($num eq $_){
            return $index;
        }
        $index++;
    }
    return;
}

#input: subroutine reference, array
#output: an array modified by the subroutine
sub my_map {
    my $subroutine = shift; #subroutine to be used
    my @array = @_;         #array to be modified
    
    foreach (@array){           #sets each array element to be modified by subroutine
        $_ = $subroutine->($_);
    }
    return @array;  
}

#input: subroutine reference, scalar as a counter initialization value, array
#output: scalar, counter that has been modified subroutine and each element of the array
sub my_reduce {
    my $subroutine = shift;     #subroutine to be used
    my $counter = shift;        #initialize counter using 2nd argument
    my @array = @_;             #array to be used
    
    foreach (@array){           #apply subroutine to counter using each element of array
        $counter = $subroutine->($counter, $_);
    }
    return $counter;
}

print "LINEAR SEARCH TEST CASES\n";
my @array1 = qw/1 a 3 3 x/;
print linear_search({value => 3, array => \@array1}), "\n";
print linear_search({array => \@array1, value => "y"}), "\n";
print linear_search({ value => "x", array => []}), "\n";
my @array2 = map { ($_ ^ 87381) ** 2 } (1 .. 100000);
print linear_search({ array => \@array2, value => 1234321 }), "\n";
print linear_search({ value => "1234321.0", array => \@array2 }), "\n";

print "MY_MAP TEST CASES\n";
print join (" ", my_map(sub { return $_[0] ** 2 }, (1 .. 10))), "\n"; #join function used to add spaces between each element in output
print join (" ", my_map(sub { return $_[0] x 2 }, qw/a b c d e/)), "\n";
my $sub_terfuge = sub {
    return "$_[0] bottles of beer on the wall, " .
    "$_[0] bottles of beer.\n" .
    "Take one down and pass it around, " .
    "@{[$_[0]-1]} bottles of beer on the wall.\n";
};
print my_map($sub_terfuge, reverse (1 .. 99));  #each element of inputted array will be replaced
                                                #by the string above, from 99 to 1
my $sub_rosa = sub {
    my $number = $_[0];
    my $ret = "";
    my $roman = sub { # Yes we can have anon subs in anon subs!
        my $letter = $_[0];
        my $value = $_[1];
        while ($number >= $value) {
            $ret .= $letter; # It can access the outer variables
            $number -= $value; # See References handout, extras
        }
    };
    my @values = ("M", 1000, "CM", 900, "D", 500, "CD", 400, "C", 100,
                    "XC", 90, "L", 50, "XL", 40, "X", 10, "IX", 9,
                    "V", 5, "IV", 4, "I", 1);
    while (scalar @values) {
        $roman->(splice @values, 0, 2); 
    }
    return $ret;
};
print join(" ", my_map($sub_rosa, (1 .. 1000))),"\n";

print "MY_REDUCE TEST CASES\n"
print my_reduce(sub { return $_[0] + $_[1] }, 0, (1 .. 10)), "\n";
print my_reduce(sub { return $_[0] * $_[1] }, 1, (1 .. 10)), "\n";
print my_reduce(sub { return $_[0] . " " . $_[1] }, qw/This is a sentence/), "\n";
my $max = sub {
    return $_[0] > $_[1] ? $_[0] : $_[1];
    # The "ternary" operator: this is equivalent to
    # if ($_[0] > $_[1]) {
    # return $_[0];
    # } else {
    # return $_[1];
    # }
    # ... but in one short line
};
print my_reduce($max, "-inf", (2, 3, 5, 7, 11, 13)), "\n";