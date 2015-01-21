#!usr/bin/perl
use strict;
use warnings;

my @lines;
my @reverselines;
print "File list: @ARGV \n";

foreach (@ARGV) {
    open (my $fh, "<", "$_") or die "file not found.\n";
    foreach (<$fh>) {
        push @lines, $_;
    }
    @reverselines = reverse @lines;
}

chomp @lines;
chomp @reverselines;

print "@lines \n";
print "@reverselines \n";        #print all lines in reverse