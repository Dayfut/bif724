#!usr/bin/perl
use warnings;
use strict;
use POSIX;

#input: 2 strings of numbers ($a, $b)
#output: 1 string $ab, the product of multiplication

#split strings into arrays @a, and @b
#reverse both arrays such that 1 2 3 becomes 3 2 1


#create an array, @subtotals, to hold subtotals of each multiplication step

#for $i = 0; while $i is less than the length of @a; increment $i by 1
#    create an array that stores the digits of the multiplication, @digits
#    declare a $carryover variable, set to 0;
#    for $j = 0; while $j is less than the length of @b; increment $j by 1
#        multiply $a[$i] with $b[$j], and store in $product
#        add $carryover to $product
#        use integer;
#        mod the product by 10 and unshift to @digits, placing it in the first element
#        divide product rounded down and store into $carryover variable, will be an integer
#
#   if the last product was >= 10 then, unshift the value onto @digits
#   
#    if $i is > 0, push '0's onto the end of the @digits array depending on size of $i
#    
#    join the @digits array push it onto @subtotals
#    
#add up all the elements in @subtotals to get the final product

print long_multiplication("123", "456"),"\n";

sub long_multiplication {
    my @a = split "", $_[0];
    my @b = split "", $_[1];
    
    my $lengtha = scalar @a;
    my $lengthb = scalar @b;
    @a = reverse @a;
    @b = reverse @b;
    
    print "reverse of a is @a\n";
    print "reverse of b is @b\n";
    
    my @subtotals;
    my $total;
    my $product;
    
    for (my $i = 0; $i < $lengtha; $i++){
        my @digits;
        my $carryover = 0;
            
        for (my $j = 0; $j < $lengthb; $j++){
            $product = $a[$i] * $b[$j];
            $product += $carryover;
            
            unshift @digits, ($product%10);
            $carryover = floor($product / 10);
        }
        if ($product >= 10) {
            unshift @digits, $carryover;
        }
        
        if ($i > 0) {
            for (my $k = 0; $k < $i; $k++){
                push @digits, '0';
            }
        }
        print "digits is @digits\n";
        push @subtotals, (join ('', @digits));
    }
    foreach(@subtotals,){
        $total += $_;
    }
    
    return $total;
}