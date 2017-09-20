use warnings;
use strict;
use diagnostics;
#Age of person
print "Enter your age in years: \n";
my $age = <>;
chomp $age;
#display age with ending result being age in seconds
print "You are.....\n";
my $age_days = $age * 365;
print "$age_days days old, or\n";
my $age_hours = $age_days * 24;
print "$age_hours hours old, or\n";
my $age_minutes = $age_hours * 60;
print "$age_minutes minutes old, or\n";
my $age_seconds = $age_minutes * 60;
print "$age_seconds seconds old. \n";
#GPA computation
print "Your GPA can be computed by quality points over credits earned!\n";
print "Enter the number of quality points earned: ";
my $quality_points = <>;
chomp $quality_points;
print "Enter the number of credit hours earned: ";
my $credit_hours = <>;
chomp $credit_hours;
if ($credit_hours == 0)
{
    print "Divide by zero error, meaning no credit hours have been accrued.\n";
} else
{
    my $gpa = $quality_points / $credit_hours;
    print "GPA: ";
    print $gpa;
    print "\n";
};