use strict;
use warnings;
use diagnostics;
use Scalar::Util qw(looks_like_number);
#user input for grade
print "Enter grade: ";
my $score = <>;
chomp $score;

#find and print score
if (looks_like_number($score)){
    if ($score < 0) {
       print "That's not a valid score!\n";
       }
    elsif ($score > 100){
        print "That's not a valid score!\n";
        }
    elsif ($score >= 90){
        print "Letter grade: A\n";
        }
    elsif ($score >= 80){
        print "Letter grade: B\n";
        }
    elsif ($score >= 70){
        print "Letter grade: C\n";
        }
    elsif ($score >= 60){
        print "Letter grade: D\n";
        }
    elsif ($score >= 0){
        print "Letter grade: F\n";
        }
    }
else {
    die "That's not a valid score!\n";
    }