use strict;
use warnings;
use diagnostics;
#ask for input
print "Enter starting balance: ";
my $balance = <>;
my $year = 0;
#use iteration technique to increment value
until($balance >= 1000000){
    $balance *= 2;
    $year++;
    if($balance > 100000 && $balance < 200000){
        print "It takes $year years to reach $balance\n";
        }
    }
print "It takes $year years to reach $balance\n";