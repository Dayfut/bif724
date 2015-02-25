#!usr/bin/perl
use strict;
use warnings;

sub insertion_sort {
    my $unsorted = shift;                 #reference to unsorted list
    my @output = ();                    #initialize the output list
    
    if (defined($_[0])) {               #if there is a 2nd list reference remaining in the arguments
        my $sortedarray = shift;        #the list reference is shifted and copied to the output list
        @output = (@$sortedarray);      #copy sorted list to the output list   
    }
    
    foreach my $unsortednum (@$unsorted){       #loop through each number in unsorted list
        my $i = 0;
        while ( $i < @output && $unsortednum > $output[$i]) { #compare number from unsorted list and moves along sorted list index until the unsorted number is greater than the number in the next index OR until the end of the sorted list
          $i++;
        }
        splice @output, $i, 0, $unsortednum;  #inserts the unsorted number into the list
    }
    return \@output;
}

sub merge_sort {
    my @array = @_;
    my $halfarray = ((scalar @array)/2);
    my @left;
    my @right;
    
    if ((scalar @array <= 1)) {
        return @array;
    } else {
        @left = merge_sort((splice @array, 0 , $halfarray));
        @right = merge_sort(@array);
    }
    return merge(\@left, \@right);
}

sub merge{
    my @left = @{$_[0]};
    my @right = @{$_[1]};
    my @combined = ();
    
    while (@left && @right) {
        if ($left[0] < $right[0]) {
            push @combined,  shift @left;
        } else {
            push @combined, shift @right;
        }
    }
    push @combined, @left;
    push @combined, @right;
    
    return @combined;
    
}

sub linear_search{
    my $equals = $_[0]->{equals};
    my $array = $_[0]->{array};
    
    if (ref($equals) eq "CODE") { #occurs when $equals is a reference
        my $i = 0;                  #set index counter to 0
        foreach (@$array){
            if ($equals->($_)){     #if element of array matches condition set inside subroutine, return matched index
                return $i;
            } else {
                $i++;               #+1 to index counter if match not found for element
            }
        }
        
    } else {                    #occurs when equals is a scalar
        my $i = 0;              #set index counter to 0
        foreach(@$array){       
            if ($equals eq $_){ #if element matches, 
                return $i;
            }else {
                $i++;       #+1 to index counter if match not found for element
            }
        }
    }
    
}

#INSERTION_SORT TEST CASES
#print join(" ", insertion_sort([5, 11, 2, 7, 3])) , "\n";
#print join(" ", insertion_sort([9, 6, 1, 10, 4, 8], [2, 3, 5, 7, 11])) , "\n";
#print join(" ", insertion_sort([])) , "\n";
#my @array1 = map { $_ % 11 } (1 .. 99);
#print join(" ", insertion_sort(\@array1)) , "\n";
#my @array2 = map { ($_ ^ 341) * 3 + 1 } (0 .. 2047);
#my @array3 = map { $_ * 3 + 1 } (0 .. 2047);
#print insertion_sort(\@array2). " and ", [@array3], "\n";
#my @array4 = map { $_ + 1 } @array2;
#print join(" ", insertion_sort(\@array4, \@array3)) , "\n";

#MERGE_SORT TEST CASES
#print join(" ", merge_sort(9, 6, 1, 10, 4, 8, 2, 3, 5, 7, 11)), "\n";
#print join(" ", merge_sort()), "\n";
#my @array5 = map { $_ ^ 21845 } (0 .. 65535);
#print join(" ", merge_sort(@array5)), "\n";
#my @array6 = map { $_ ** 2 } @array5;
#print join(" ", merge_sort(@array6)), "\n";
#my @array7 = map { int($_ ** 0.5) } @array5;
#print join(" ", merge_sort(@array7)), "\n";

#LINEAR_SEARCH TEST CASES
#print linear_search({ equals => 3, array => [qw/1 a 3 3 x/] }), "\n";
#print linear_search({ array => [qw/1 a 3 3 x/], equals => sub { return $_[0] eq "y" } }), "\n";
#print linear_search({ equals => sub { return 1 }, array => []}), "\n";
#my @array8 = map { ($_ ^ 87381) ** 2 } (1 .. 100000);
#print linear_search({ equals => sub { return $_[0] == 1234321 }, array => \@array8 }), "\n";
#print linear_search({ array => \@array8, equals => "1234321.0" }), "\n";