use diagnostics;
use warnings;
use strict;
#data input
print "What is the annual growth rate in percent?: ";
my $growth_rate = <>;
chomp $growth_rate;
print "What is the inflation rate in percent?: ";
my $inflation_rate = <>;
chomp $inflation_rate;

#What economic policy needs put in place?
if ($growth_rate < 1){
    if ($inflation_rate < 3){
        print "Increase welfare spending, reduce personal taxes, and decrease the discount rate.\n";
        }
    else{ print "Reduce business taxes.\n";}
    }
elsif ($growth_rate > 4){
    if ($inflation_rate < 1){
        print "Increase personal and business taxes, and decrease the discount rate.\n";
        }
    elsif ($inflation_rate > 3){
        print "Increase the discount rate.\n"
        }
    else {print "No change in economic policy needed. \n";}
    }
else{ print "No change in economic policy needed.\n";}