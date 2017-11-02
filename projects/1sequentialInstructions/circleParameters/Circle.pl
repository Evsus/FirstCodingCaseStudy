use strict;
use diagnostics;
use warnings;
use Math::Trig;
print "Enter a radius value: ";
chomp (my $radius = <>);
my $diameter = $radius * 2;
my $circumference = (2 * pi * $radius);
my $area = (pi * ($radius ** 2));
print
    "Diameter = $diameter\n" ,
    "Circumference = $circumference\n" ,
    "Area = $area\n";
