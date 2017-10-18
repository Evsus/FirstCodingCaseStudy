use strict;
use diagnostics;
use warnings;
use Scalar::Util qw(looks_like_number);
my $single = 1;
my $double = 2;
my $suite = 3;
my $room_type;
my $room_floor;
my $room_nights;
#what room do they want?
    #there's a lot of particular jargon in the below that I'll comment on the commit for.
ROOM_TYPE: {do{
    print "Enter room type: ";
    $room_type = <>;
    chomp $room_type;
    (($room_type =~ m/\d/) && (($room_type == $single) || ($room_type == $double) || ($room_type == $suite))) ? last : (print "That's not a valid room!\n")
    }until()}
ROOM_FLOOR: {do{
    print "Enter desired floor: ";
    $room_floor = <>;
    chomp $room_floor;
    (($room_floor =~ m/\d/) && ($room_floor >= 1 && $room_floor <= 12)) ? last : (print "That's not a valid floor!\n")
    }until()}
if($room_type == 1 && $room_floor == 12){
    print  "There are no singles on the 12th floor.\n";
    goto ROOM_FLOOR;
    }
ROOM_NIGHTS: {do{
    print "Enter number of nights: ";
    $room_nights = <>;
    chomp $room_nights;
    (($room_nights =~ m/\d/) && ($room_nights > 0)) ? last : (print "You have to stay at least one night.\n")
    }until()}

#How much do they spend?
if($room_floor >= 1 && $room_floor <= 5){
    if($room_type == 1){
        $room_nights *= 45;
        print "Single rate on floor $room_floor is";
        print ' $45.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    elsif($room_type == 2){
        $room_nights *= 60;
        print "Double rate on floor $room_floor is";
        print ' $60.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    elsif($room_type == 3){
        $room_nights *= 130;
        print "Suite rate on floor $room_floor is";
        print ' $130.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    }
if($room_floor >= 6 && $room_floor <= 11){
    if($room_type == 1){
        $room_nights *= 55;
        print "Single rate on floor $room_floor is";
        print ' $55.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    elsif($room_type == 2){
        $room_nights *= 72;
        print "Double rate on floor $room_floor is";
        print ' $72.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    elsif($room_type == 3){
        $room_nights *= 215;
        print "Suite rate on floor $room_floor is";
        print ' $215.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    }
if($room_floor == 12){
    if($room_type == 2){
        $room_nights *= 120;
        print "Double rate on floor $room_floor is";
        print ' $120.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    elsif($room_type == 3){
        $room_nights *= 350;
        print "Suite rate on floor $room_floor is";
        print ' $350.00 nightly, for a total of $';
        print "$room_nights\n";
        }
    }