print "Welcome to the NIM simulator!\n";
use warnings;
use diagnostics;
use strict;

#global variables
my $user_go_first;
my $stones;
my $continue = "yes";

#create subs
sub player_turn{{
    if($stones == 0){
        print "You win!\n\n";
        last;
        }
    print "How many would you like to remove - 1 or 2? ";
    chomp(my $user_input = <>);
    if($user_input !~ /\d/){
        redo;
        }
    elsif((($stones - $user_input) < 0) || ($user_input > 2) || ($user_input < 1)){
        print "You cannot remove $user_input stones.\n\n";
        redo;
        }
    $stones = $stones - $user_input;
    print "the number of stones left is $stones\n\n";
        }}
sub computer_turn{{
    if($stones == 0){
        print "The computer wins!\n\n";
        last;
        }
    elsif(($stones % 3) == 0){
        $stones = $stones - 2;
        print "The computer removes 2 stones.\n";
        }
    else{
        $stones = $stones - 1;
        print "The computer removes 1 stone.\n";
        }
    print "The number of stones left is $stones\n\n";
    }}
sub player_one{
    if($user_go_first =~ /y/i){
        player_turn();
        }
    else{
        computer_turn();
        }
    }
sub player_two{
    if($user_go_first =~ /y/i){
        computer_turn();
        }
    else{
        player_turn();
        }
    }
sub starting_stones{{
    print "\nEnter the number of starting stones: ";
    chomp (my $user_input = <>);
    if($user_input < 1){
        print "you cannot start with $user_input stones.\n";
        redo;
        }
    else{
        return $user_input
        }
    }}

#script main body
while($continue =~ /y/i){
    $stones = starting_stones();
    print "Would you like to go first? (y/n): ";
    chomp($user_go_first = <>);
    print "\n";
    until($stones == 0){
        player_one();
        player_two();
        }
    my $user_input = 0;
    while($user_input !~ /y|n/i){
        print "Do you want to play again? (y/n): ";
        $user_input = <>;
        }
    if($user_input =~ /n/i){
        $continue = 0;
        }
    #else do nothing as $continue is already "yes"
    }