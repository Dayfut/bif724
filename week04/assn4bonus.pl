#!usr/bin/perl
use warnings;
use strict;

#Binary Search subroutines
#input: scalar, number to match | scalar, reference to array
#output: passes both scalars to binary_search_work subroutine along with first and last index scalar values
sub binary_search_range {
	my $first = 0;	#set up first index
	my $array = $_[1];
	my $last = (scalar @$array);	#set up last index
	my @foundRange = binary_search_work($_[0], $_[1], $first, $last);	#runs subroutine that will do the search
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
			return (binary_search_first($num, $array, 0, $middleIndex), binary_search_last($num, $array, $middleIndex, (scalar \@$array) + 1));								#if $num middle number matches $num, return the middle index
		}
	}
}

sub binary_search_first {
	my $num = $_[0];
	my $array = $_[1];
	my $startIndex = $_[2];
	my $endIndex = $_[3];
	my $middleIndex = int(($startIndex + $endIndex)/2);	#determine middle index and middle number from the reference
	my $middleNumber = $array->[$middleIndex];
	
	if ($num <= $middleNumber){								#if $num is less than middle number
		my $beforeIndex = $middleIndex - 1;
		my $before = $array->[$beforeIndex];
		if ($before != $num) {
			return $middleIndex;
		}
		return binary_search_first($num, $array, $startIndex, $beforeIndex+1);	#run subroutine again with bottom half of array excluding middle
	} else {							#if $num is greater than middle number
		return binary_search_first($num, $array, $middleIndex + 1, $endIndex);	#run subroutine with upper half of array
	}
}

sub binary_search_last {
	my $num = $_[0];
	my $array = $_[1];
	my $startIndex = $_[2];
	my $endIndex = $_[3];
	my $middleIndex = int(($startIndex + $endIndex)/2);	#determine middle index and middle number from the reference
	my $middleNumber = $array->[$middleIndex];
	
	if ($num => $middleNumber){								#if $num is less than middle number
		my $afterIndex = $middleIndex + 1;
		my $after = $array->[$afterIndex];
		if ($after != $num) {
			return $afterIndex;
		}
		return binary_search_first($num, $array, $middleIndex + 1, $endIndex);	#run subroutine again with bottom half of array excluding middle
	} else {							#if $num is greater than middle number
		return binary_search_first($num, $array, $startIndex, $middleIndex);	#run subroutine with upper half of array
	}
}

my @testarray = qw/2 3 5 7 11/;
print binary_search_range(7, \@testarray);