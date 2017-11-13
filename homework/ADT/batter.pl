use strict;
use warnings;
use diagnostics;

#constructor
sub new{
    my %self = (
        F_name => shift,
        L_name => shift,
        hits => shift,
        bats => shift
        );
    my $self = \%self;
    return bless $self;
    }
sub batting_average{
    my $self = shift;
    #my $bats = ($self->{bats});
    #my $hits = ($self->{hits});
    my $average = ($self->{bats} / $self->{hits});
    return $average;
}
    
sub batter{
    print "Enter first name: ";
    chomp (my $F_name = <>);
    print "Enter last name: ";
    chomp (my $L_name = <>);
    print "Enter number of hits: ";
    chomp (my $hits = <>);
    print "Enter how many times at bat: ";
    chomp (my $bats = <>);
    return ($F_name , $L_name , $hits , $bats);
    }
my $end_condition = 0;
my $batter_obj;
do{{
    print "What would you like to do?\n[M]ake new batter, [C]alculate batting average, [E]nd.: ";
    my $user_input = <>;
    if($user_input !~ /m|c|e/i){
        redo;
        }
    elsif($user_input =~ /m/i){
        my @batter_info = batter();
        (my $F_name , my $L_name , my $hits , my $bats) = @batter_info;
        $batter_obj = new($F_name , $L_name , $hits , $bats);
        }
    elsif($user_input =~ /c/i){
        my $average = $batter_obj->batting_average();
        print "Batting average of $batter_obj->{F_name} $batter_obj->{L_name} is $average!\n";
    }
    elsif($user_input =~ /e/i){
        print "Goodbye\n";
        $end_condition = 1;
    }
}}while($end_condition == 0)