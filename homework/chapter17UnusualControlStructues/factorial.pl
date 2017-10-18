use warnings;
use diagnostics;
use strict;
#recursive factorial
my $factorial = 10000000;
my $answer = 1;
FACTORIAL: if($factorial == 1){
    print "$factorial";
    print '=';
    $answer *= $factorial;
    print "$answer\n";
    }
else{
    print "$factorial";
    print '*';
    $answer *= $factorial;
    $factorial -= 1;
    goto FACTORIAL;
    }