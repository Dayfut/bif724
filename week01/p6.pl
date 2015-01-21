#!usr/bin/perl
use strict;
use warnings;

my @lines;

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
    if (exists $valuenumbers{$_}) {
        $valuenumbers{$_}++;
    } else {
        $valuenumbers{$_} = 1;
    }
}

print "lines:\n@lines\n";

my @keys = keys %valuenumbers;

print "\nline\tnumber of appearances\n";
foreach (@keys){
    print "$_\t$valuenumbers{$_}\n";
}