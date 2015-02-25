#!usr/bin/perl
use warnings;
use strict;

my $string = "1234";
my @numbers = split "", $string;
my $total = 0;

foreach (@numbers){
    $total += $_;
}

print "$total\n";