use strict;
use warnings;
use diagnostics;

#global vars
my $end_condition = 0;
my $batter_obj;

#constructor
sub new{
    my $self = {
                name => shift,
                hits => shift,
                bats => shift,
                fields => shift,
                error => shift,
                };
    return bless $self;
    } #syntax is name - hits - bats - fields - error
#other subroutines
sub batting_average{
    my $self = shift;
    #my $bats = ($self->{bats});
    #my $hits = ($self->{hits});
    my $average = ($self->{bats} / $self->{hits});
    return $average;
}
sub batter{
    print "Enter name: ";
    chomp (my $name = <>);
    print "Enter number of hits: ";
    chomp (my $hits = <>);
    print "Enter how many times at bat: ";
    chomp (my $bats = <>);
    print "Enter number of defensive field plays: ";
    chomp (my $defense = <>);
    print "Enter how many errors commited: ";
    chomp (my $error = <>);
    return ($name , $hits , $bats , $defense , $error);
    }
#main script
do{{
    print "What would you like to do?\n[M]ake new batter, Calculate [B]atting average, Calculate [F]ielding percent, [A]sk for stats, [E]nd.: ";
    my $user_input = <>;
    if($user_input !~ /m|a|b|f|e/i){
        redo;
        }
    elsif($user_input =~ /m/i){
        $batter_obj = new(batter());
        }
    elsif($user_input =~ /b/i){
        my $average = $batter_obj->batting_average();
        print "Batting average of $batter_obj->{name} is $average!\n";
    }
    elsif($user_input =~ /f/i){
        #autovivify
        $batter_obj->{field_percent} = (($batter_obj->{fields} - $batter_obj->{error}) / $batter_obj->{fields});
        print "$batter_obj->{name} has a field percent of $batter_obj->{field_percent}!\n";
    }
    elsif($user_input =~ /a/i){
        print "What do you want to know? [N]ame, [H]its, [B]ats, [F]ields, [E]rrors, Fielding [P]ercent: ";
        my $user_input = <>;
        if($user_input !~ /n|h|b|f|e|p/i){
            print "that's not a valid input\n";
            redo;
            }
        elsif($user_input =~ /n/i){
            print "Batter's name is: $batter_obj->{name}\n";
            }
        elsif($user_input =~ /h/i){
            print "$batter_obj->{name} has $batter_obj->{hits} hits!\n";
            }
        elsif($user_input =~ /b/i){
            print "$batter_obj->{name} has batted $batter_obj->{bats} times!\n";
            }
        elsif($user_input =~ /f/i){
            print "$batter_obj->{name} has fielded $batter_obj->{fields} times!\n";
            }
        elsif($user_input =~ /e/i){
            print "$batter_obj->{name} has $batter_obj->{error} errors!\n";
            }
        elsif($user_input =~ /p/i){
            if($batter_obj->{field_percent} == 0){
                print "Not calculated yet!\n";
                }
            else{
                print "field percent of $batter_obj->{name} is: $batter_obj->{field_percent}\n";
                }
        }
    }
    elsif($user_input =~ /e/i){
        print "Goodbye\n";
        $end_condition = 1;
    }
}}while($end_condition == 0)