use strict;
use warnings;
use diagnostics;
#salutation
print "Welcome to Jereomy's elevator simulator!\n";

#elevator object
sub new{
     my $self = {
                    floor => shift,
                };
    return bless $self;
}
#create subs
sub GOTO_FLOOR{
    (my $current_number , my $target_number) = @_;
    for(my $i = (100 - abs($target_number - $current_number)) ; $i != 100 ; $i++){
        if($current_number < $target_number){
            $current_number++;
            if($current_number == 13){
                next;
                }
            }
        elsif($current_number > $target_number){
            $current_number--;
            if($current_number == 13){
                next;
                }
            }
        print "$current_number..";
    }
    print "Ding!\n";
    return $current_number;
    } #returns current floor after moving to target floor syntax: (start , finish)

sub FIRE_ALARM{
    my $ground_floor = 1;
    my $current_floor = shift;
    print "Danger!  You must exit the building now!\n";
    unless($current_floor == $ground_floor){
        GOTO_FLOOR($current_floor , $ground_floor);
        }
    return $ground_floor;
    }

#main script
my $ground_floor = 1;
my $current_floor = new($ground_floor);
my $top_floor = 100;
while(){
    print "Options: (s)elect a floor, (f)ire alarm, or (q)uit\n",
    "Enter s, f, or q ==> ";
    my $user_option = <>;
    if($user_option =~ /q/i){
        last;
        }
    elsif($user_option =~ /s/i){{
        print "Enter the floor that you'd like to go to ==> ";
        chomp(my $floor_input = <>);
        if(($floor_input !~ /^\d+$/) || ($floor_input < 0) || ($floor_input > 100) || ($floor_input == 13)){
            print "Invalid floor selection - must be between 1 and 100, excluding 13.\n";
            last;
            }
        elsif($current_floor->{floor} > $floor_input){
            print "Going down!..";
            }
        elsif($current_floor->{floor} < $floor_input){
            print "Going up!..";
            }
        #else already there.
        $current_floor->{floor} = GOTO_FLOOR($current_floor->{floor} , $floor_input);
        }}
    elsif($user_option =~ /f/i){
        $current_floor->{floor} = FIRE_ALARM($current_floor->{floor});
        }
    else{
        print "Invalid selection.\n";
        }
    }
#eof