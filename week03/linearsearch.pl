#!usr/bin/perl
use strict;
use warnings;

#Linear Search
sub linear_search {		#accepts a scalar and an array, searches for the scalar in the array
	my $needle = shift @_;
	my @haystack = @_;
	
	print "$needle\n";
	print "@haystack\n";
	
	foreach (@haystack) {
		if ($needle eq $_) {
			return "true";
		}
	}
	return "false";
}

#Linear Search, recursive
sub linear_search_recursive {
	my $needle = shift @_;
	my @haystack = @_;
	
	if (scalar @haystack <= 0) {
		return "false";
	} elsif ($haystack[0] eq $needle){
		return "true";
	} else {
		shift @haystack;
		linear_search_recursive($needle, @haystack)
	}
}

#binary search, recursive
sub binary_search {
    my @haystack = @_;
    my $needle = shift @haystack;
    my $length = scalar @haystack;
    
    if ($length == 0) {
        return 0;
        
    } elsif ($haystack[$length/2] == $needle) {
        return 1;
        
    } elsif ($haystack[$length/2] > $needle){
        splice @haystack, ($length+1)/2;
        return binary_search($needle, @haystack);
        
    } elsif ($haystack[$length/2] < $needle) {
        splice @haystack, 0, ($length+1)/2;
        return binary_search($needle, @haystack);
    }
}

#binary search, iterative
sub binary_search_iterative{
	my $needle = shift @_;
	my @haystack = @_;
	
	while (@haystack) {
		my $length = scalar @haystack;
	
		if ($haystack[$length/2] == $needle){
			return "true";
		} elsif ($haystack[$length/2] > $needle){
			@haystack = splice @haystack, 0, ($length+1)/2;
		} elsif ($haystack[$length/2] < $needle){
			@haystack = splice @haystack, ($length+1)/2, $length;
		}
	}
	return "false";
}

#print linear_search(@ARGV), "\n";
#print linear_search_recursive(@ARGV), "\n";
my @sortedARGV = sort @ARGV;
print binary_search_iterative(@sortedARGV), "\n";