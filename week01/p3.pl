#!usr/bin/perl
use strict;
use warnings;

my @lines;
my @sortedlines;
print "File list: @ARGV \n";

foreach (@ARGV) {
    open (my $fh, "<", "$_") or die "file not found.\n";
    foreach (<$fh>) {
        push @lines, $_;
    }
    @sortedlines = sort @lines;
}

chomp @lines;
chomp @sortedlines;

print "@lines \n";
print "@sortedlines \n";        #print all sorted lines