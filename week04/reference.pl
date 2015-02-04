#!usr/bin/perl
use warnings;
use strict;

my @array = qw/1 a 2 3 4 f s/;
my $reference = \@array;

print "reference address is -> $reference\n";
print "first element is ", $reference->[0], "\n";
print "second element is ", $reference->[1], "\n";
print "the entire array is ", @$reference, "\n\n";

#hashes can also be referenced

my %hash = qw/first a second b third b/;
my $refhash = \%hash;
print "value of first is ", $refhash->{first}, "\n";
print "the size of the hash is ", scalar keys %$refhash, "\n";

#scalars can be referenced
my $scalar = 15;
my $refscalar = \$scalar;
print "the scalar is $$refscalar\n";

#ref operator tells you what datatype the reference points to
print ref $reference, "\n";
print ref $refhash, "\n";
print ref $refscalar, "\n";

print ref @array, "\n"; #these return false because they are not references
print ref %hash, "\n";
print ref $scalar, "\n";

#references can be used to pass non-scalar values into an array
sub references{
    #my @array = @$_[0]; dereferences the array and takes its [0]... WE DONT WANT THAT
    my @array = @{$_[0]}; # dereferences $_[0] as an array
}