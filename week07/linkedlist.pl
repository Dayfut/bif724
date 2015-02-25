#!usr/bin/perl
use strict;
use warnings;

sub create_list{
    return undef;
}

sub access_item {
    my $list = shift;
    my $nth = shift;
    
    for (my $i = 0; $i < $nth; $i++){
        $list = $list->[1];
    }
    
    return $list->[0];
}

sub insert_item {
    my $list = $_[0];
    my $insert = $_[1];
    my $pos = $_[2];
    
    if (!defined $list) {
        return [$insert,[]];
    } else {
    
        for (my $i = 0; $i < $pos - 1; $i++){
            $list = $list->[1];
        }
        
        $list->[1] = [$insert, $list->[1]]; 
    }
    return $_[0];
}

sub remove_item{
    my $list = $_[0];
    my $pos = $_[1];
    
    for (my $i = 0; $i < $pos - 1; $i++){   #finds the position to be deleted
        $list = $list->[1];
    }
    $list->[1]= $list->[1]->[1];        #sets reference to the position to point to the reference after
    return $_[0]
}

#my $test = ['a',['b',['c', []]]];
my $test = create_list();
$test = insert_item($test, 'a', 0);
$test = insert_item($test, 'b', 1);
$test = insert_item($test, 'c', 2);

print "BEFORE INSERT\n";
print access_item($test, 0), "\n";
print access_item($test, 1), "\n";
print access_item($test, 2), "\n";

my $after_insert = insert_item($test, 'hi', 1);
print "AFTER INSERT\n";
print access_item($after_insert, 0), "\n";
print access_item($after_insert, 1), "\n";
print access_item($after_insert, 2), "\n";
print access_item($after_insert, 3), "\n";

my $after_delete = remove_item($after_insert, 1);
print "AFTER DELETING INDEX 1\n";
print access_item($after_delete, 0), "\n";
print access_item($after_delete, 1), "\n";
print access_item($after_delete, 2), "\n";
print access_item($after_delete, 3), "\n";
print "^^ error because index 3 does not exist anymore after deletion\n";