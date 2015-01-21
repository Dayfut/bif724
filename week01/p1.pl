#!usr/bin/perl
use strict;
use warnings;

my @lines;
my @reversefiles = reverse @ARGV;
print "File list: @ARGV \n";
print "File list in reverse: @reversefiles\n";

foreach (@reversefiles) {
    open (my $fh, "<", "$_") or die "file not found.\n";
    foreach (<$fh>) {
        push @lines, $_;
    }
}

chomp @lines;

print "@lines \n";