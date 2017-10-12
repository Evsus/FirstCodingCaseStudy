use warnings;
use diagnostics;
use strict;
use Scalar::Util qw(looks_like_number);
#test input
print "Enter first score: ";
my $first_score = <>;
print "Enter second score: ";
my $second_score = <>;
print "Enter third score: ";
my $third_score = <>;
print "Enter fourth score: ";
my $fourth_score = <>;
print "Enter fifth score: ";
my $fifth_score = <>;
my $place_holder = 0;
#sort and drop lowest and average
until ($first_score <= $second_score && $second_score <= $third_score && $third_score <= $fourth_score && $fourth_score <= $fifth_score) {
    if ($fourth_score > $fifth_score){
        $place_holder = $fifth_score;
        $fifth_score = $fourth_score;
        $fourth_score = $place_holder;
        }
    if ($third_score > $fourth_score){
        $place_holder = $fourth_score;
        $fourth_score = $third_score;
        $third_score = $place_holder;
        }
    if ($second_score > $third_score){
        $place_holder = $third_score;
        $third_score = $second_score;
        $second_score = $place_holder;
        }
    if ($first_score > $second_score){
        $place_holder = $second_score;
        $second_score = $first_score;
        $first_score = $place_holder;
        }
}
my $average = (($second_score + $third_score + $fourth_score + $fifth_score) / 4);
#Round (idea courtesy given by benn of perlmonks) (this isn't full proof, just workable for this scenario)
$average = int($average + .5);

#give letter grade
my $grade = 1;
if (looks_like_number($average)){
    if ($average < 0) {
       print "That's not a valid score!\n";
        }
    elsif ($average > 100){
        $grade = "A+";
        }
    elsif ($average >= 90){
        $grade = "A";
        }
    elsif ($average >= 80){
        $grade = "B";
        }
    elsif ($average >= 70){
        $grade = "C";
        }
    elsif ($average >= 60){
        $grade = "D";
        }
    elsif ($average >= 0){
        $grade = "F";
        }
    }
else {
    die "That's not a valid score!\n";
    }
print "You're average is $average and your grade is $grade\n"