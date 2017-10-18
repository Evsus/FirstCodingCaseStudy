use warnings;
use diagnostics;
use strict;
#user input and stopping distance needed
my $range = 20;
print "Enter speed (in mph): ";
my $speed = <>;
print "Enter tailgate distance (in feet): ";
my $tailgate = <>;
my $stopping_distance = ($speed * (2.25 + $speed / 21));

#is this safe?
if((($tailgate) <= ($stopping_distance + $range)) && ($tailgate >= ($stopping_distance - $range))){
    print "minor wreck.\n";
    }
elsif($tailgate < ($stopping_distance - $range)){
    print "Major wreck!\n";
    }

elsif($tailgate > ($stopping_distance + $range)){
    print "No problem.\n";
    }