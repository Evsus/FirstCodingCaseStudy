use warnings;
use diagnostics;
use strict;
my $word = 0;
my $suffix = 0;
#execute and repeat
{do{
    #take user input
    print "Enter a word: ";
    chomp ($word = <>);
    if($word =~ /^q$/){
        print "I hope you enjoyed your translation experience!  Please come again!\n";
        last;
    }
    my $ok_input = 1;
    #convert word to array for easier handling
    my @word = split(//, $word);
    #test for validity
    foreach(@word){
        if($_ !~ /([a-z])/){
            print "Invalid input - can't process this character: $_", "\n";
            $ok_input = 0;
            last;
            }
        }
    #turn to pig word
     if($ok_input == 1){
        #if vowels
        #I am not spacing vowels out, forget style points for sake of compact points
        if($word[0] =~ (/a|e|i|o|u/)){
            $suffix = "";
            }
        #put consonant at the end
        else{
            my $consonant = shift(@word);
            $suffix = $consonant . "ay";
            }
        #concatenate the pig array into the pigword
        push @word , $suffix;
        my $pig_word = (join('' , @word));
        print "in Pig Latin, that's $pig_word \n";
     }
    }until()}