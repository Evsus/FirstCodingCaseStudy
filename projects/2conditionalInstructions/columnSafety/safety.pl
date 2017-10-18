use strict;
use diagnostics;
use warnings;
#known values
my $slenderness_limit = 50;
my $MoE = 1700000;
my $stress = 1450;

#wood size input
print "Enter column width in inches: ";
my $width = <>;
chomp $width;
print "Enter column height in feet: ";
#converts input from feet to inches
my $height = (<> * 12);
chomp $height;
print "Enter expected load in pounds: ";
my $load = <>;
chomp $load;
#Math for load limit
my $area = ($width * $width);
if (($height / $width) <= $slenderness_limit){
    if ($load <= ((0.3 * $MoE * $area) / (($height / $width) ** 2))){
        if ($load <= ($area * $stress)){
            print "Column is safe!\n";
            }
        else{
            print "Column is unsafe!\n";
            }
        }
    else{
        print "Column is unsafe!\n";
        }
    }
else{
    print "Column is unsafe!\n";
    }