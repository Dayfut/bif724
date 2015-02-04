#!usr/bin/perl
use warnings;
use strict;

my @start = qw/1 2 3/;
my @start2 = qw/1 2 3/;
my @start3 = qw/1 2 3/;

print "@start\n";
pass_by_value(@start);
print "@start\n";

my $refstart2 = \@start2;
print "@start2\n";
deref_by_reference($refstart2);
print "@start2\n";

my $refstart3 = \@start3;
print "@start3\n";
pass_by_reference($refstart3);
print "@start3\n";

sub pass_by_value {
    my @array = @_;
    $array[0] += 1;
}

sub deref_by_reference {
    my @array = @{$_[0]};
    $array[0] += 1;
}

sub pass_by_reference {
    my $refarray = $_[0];
    $refarray->[0] += 1;
}

