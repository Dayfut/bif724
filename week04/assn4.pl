#!usr/bin/perl
use warnings;
use strict;

#Author: David Cheung
#Date Submitted: Feb 11, 2014

#Linear Search
#input: scalar, number to match | scalar, reference to array
#output: returns scalar of index of matched number from array if successful match
sub linear_search {
	my $num = $_[0];	#retrieve search number and array reference
	my $array = $_[1];
	my $index = 0;		#the index that the matched number is contained in
	
	foreach (@$array) {	#compare each element of @haystack to $num, return true if match found
		if ($num eq $_) {
			return $index;
		}
	
	$index++;
	}
}

#Binary Search subroutines
#input: scalar, number to match | scalar, reference to array
#output: passes both scalars to binary_search_work subroutine along with first and last index scalar values
sub binary_search {
	my $first = 0;	#set up first index
	my $array = $_[1];
	my $last = (scalar @$array);	#set up last index
	return binary_search_work($_[0], $_[1], $first, $last);	#runs subroutine that will do the search
}

#input: scalar, number to match | scalar, reference to array | scalar, first index | scalar, last index
#output: returns scalar of index of matched number from array if successful match
#	runs subroutine with narrowing sets of first and last index until number is matched
#	or until the last index is less or equal to the start index
sub binary_search_work {
	my $num = $_[0];	#retrieve search number, array reference, start and end index
	my $array = $_[1];
	my $startIndex = $_[2];	
	my $endIndex = $_[3];
	
	if ($endIndex <= $startIndex) {		#if the end index is greater than the start index, exit
		return;
	} else {
		my $middleIndex = int(($startIndex + $endIndex)/2);	#determine middle index and middle number from the reference
		my $middleNumber = $array->[$middleIndex];
	
		if ($middleNumber > $num){								#if $num is less than middle number
			return binary_search_work($num, $array, $startIndex, $middleIndex);	#run subroutine again with bottom half of array excluding middle
		} elsif ($middleNumber < $num) {							#if $num is greater than middle number
			return binary_search_work($num, $array, $middleIndex + 1, $endIndex);	#run subroutine with upper half of array
		} else{
			return $middleIndex;								#if $num middle number matches $num, return the middle index
		}
	}
}

# TEST CASES
print "LINEAR_SEARCH TEST CASES\n";
my @array1 = qw/1 a 3 3 x/;
print linear_search('3', \@array1), "\n";
print linear_search('"y"', \@array1), "\n";
my @array2 = ();
print linear_search("x", \@array2), "\n";
my @array3 = map {($_^87381) ** 2} (1 .. 100000);
print linear_search(1234321, \@array3), "\n";
print linear_search(1234322, \@array3), "\n";

print "BINARY_SEARCH TEST CASES\n";
my @array4 = qw/2 3 5 7 11/;
print binary_search(7, \@array4), "\n";
print binary_search(8, \@array4), "\n";
print binary_search(9, \@array2), "\n";
my @array5 = map { int($_ ** 0.5) * 2} (1 .. 10000000);
print binary_search(1000, \@array5), "\n";
print binary_search(1001, \@array5), "\n";