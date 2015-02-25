#!usr/bin/perl
use warnings;
use strict;

#subroutines can also be stored as references
#here, we will make an anonymous subroutine

my $sub_ref = sub {
    print "this subroutine is anonymous\n";
};


my $do_n_times = sub {
    my $subroutine = $_[0]; #the subroutine that will be called
    my $times = $_[1];      #the number of times that the subroutine will be called
    
    foreach (1 .. $times){
        $subroutine->();
    }  
}

$do_n_times->($sub_ref->(), 4);
sub_ref->();   #the brackets will store the arguments to be passed into the subroutine