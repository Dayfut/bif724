#!usr/bin/perl
use strict;
use warnings;

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
my %valuenumbers;
foreach (@lines) {
    if (not exists $valuenumbers{$_}) {
        $valuenumbers{$_} = '';
    }
}

my @keys = sort (keys %valuenumbers);

print "lines:\n@lines\n";
print "unique sorted lines:\n@keys\n";