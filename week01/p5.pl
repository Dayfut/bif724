#!usr/bin/perl
use strict;
use warnings;
use List::MoreUtils qw(uniq);

my @lines;
my @sortedlines;
my @sorteduniquelines;
print "File list: @ARGV \n";

foreach (@ARGV) {
    open (my $fh, "<", "$_") or die "file not found.\n";
    foreach (<$fh>) {
        push @lines, $_;
    }
}

chomp @lines;
my @uniquelines = uniq @lines;
print "all lines:\n@lines\n";
print "all unique lines in order of appearance:\n@uniquelines\n"