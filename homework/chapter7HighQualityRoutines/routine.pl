use strict;
use warnings;
use diagnostics;

#routine
sub how_many_cheers{{
    #set user_number to outside the loop parameters
    my $user_number = 0;
    print "Enter a number between 1 and 10: ";
    $user_number = int(<>);
    if($user_number > 10 || $user_number < 1){
        redo;
        }
    return $user_number;
    }}
#cheers!
print "Congratulation\n" x how_many_cheers();