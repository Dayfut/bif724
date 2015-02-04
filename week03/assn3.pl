#!usr/bin/perl
use strict;
use warnings;

#Author: David Cheung
#Date: Feb 4, 2015
#Program: Assignment 3 - Different Methods of Linear Search and Binary Search

#Linear Search
sub linear_search {
	my $needle = shift @_;	#retrieve needle
	my @haystack = @_;	#retrieve haystack
	
	foreach (@haystack) {	#compare each element of @haystack to needle, return true if match found
		if ($needle eq $_) {
			return 1;
		}
	}
	return 0;
}

#Linear Search, recursive
sub linear_search_recursive {
	my $needle = shift @_; 	#retrieve needle
	my @haystack = @_; 	#retrieve haystack
	
	if (scalar @haystack <= 0) {	#if haystack has no elements, return false
		return 0;
	} elsif ($haystack[0] eq $needle){ #if current element of haystack matches $needle, return true
		return 1;
	} else {			#if current element of haystack does not match $needle,
		shift @haystack;	#remove first element of @haystack and run subroutine with remaining @haystack
		linear_search_recursive($needle, @haystack)
	}
}

#binary search, recursive
sub binary_search {
    my @haystack = @_; 			#retrieve haystack
    my $needle = shift @haystack; 	#retrieve needle
    my $length = scalar @haystack;
    
    if ($length == 0) {	#if haystack no longer has elements, return false
        return 0;
        
    } elsif ($haystack[$length/2] == $needle) {	#if middle element matches $needle, return true
        return 1;
        
    } elsif ($haystack[$length/2] > $needle){	#if needle is greater than the middle number,
        splice @haystack, ($length+1)/2;	#cut off the bottom half of #haystack and
        return binary_search($needle, @haystack);# run subroutine again with upper half of @haystack
        
    } elsif ($haystack[$length/2] < $needle) { #does the same as above, but run with bottom half
        splice @haystack, 0, ($length+1)/2;
        return binary_search($needle, @haystack);
    }
}

#binary search, iterative
sub binary_search_iterative{
	my $needle = shift @_; #retrieve needle
	my @haystack = @_; #retrieve haystack
	
	while (@haystack) {
		my $length = scalar @haystack;	#declare length each time loop runs because
						#@haystack shortens with each iteration
		if ($haystack[$length/2] == $needle){	#return true if $needle matches middle element
			return 1;
		} elsif ($haystack[$length/2] > $needle){ #cut off lower half of @haystack if $needle is larger than middle
			@haystack = splice @haystack, 0, ($length+1)/2;
		} elsif ($haystack[$length/2] < $needle){ #cut off upper half of @haystack if $needle is smaller than middle 
			@haystack = splice @haystack, ($length+1)/2, $length;
		}
	}
	return 0;
}

# TEST CASES
print "linear_search tests\n";
my @array = map {($_^85) ** 2} (1..100);
print linear_search(3, qw/1 a 3 3 x/), "\n";
print linear_search("y", qw/1 a 3 3 x/), "\n";
print linear_search("x", ()), "\n";
print linear_search(100, @array), "\n";
print linear_search(101, @array), "\n\n";

print "linear_search_recursive tests\n";
print linear_search_recursive(3, qw/1 a 3 3 x/), "\n";
print linear_search_recursive("y", qw/1 a 3 3 x/), "\n";
print linear_search_recursive("x", ()), "\n";
print linear_search_recursive(100, @array), "\n";
print linear_search_recursive(101, @array), "\n\n";

@array = map{ $_ ** 2 } (1 .. 10000);
print "binary_search tests\n";
print binary_search(7, qw/2 3 5 7 11/), "\n";
print binary_search(8, qw/2 3 5 7 11/), "\n";
print binary_search(7, ()), "\n";
print binary_search(2772225, @array),"\n";
print binary_search(2772226, @array),"\n\n";

print "binary_search_iterative tests\n";
print binary_search_iterative(7, qw/2 3 5 7 11/), "\n";
print binary_search_iterative(8, qw/2 3 5 7 11/), "\n";
print binary_search_iterative(7, ()), "\n";
print binary_search_iterative(2772225, @array),"\n";
print binary_search_iterative(2772226, @array),"\n";