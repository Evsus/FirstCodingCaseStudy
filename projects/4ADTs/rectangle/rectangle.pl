use strict;
use diagnostics;
use warnings;

#rectangle package
package rectangle
{
    sub new{
        my $class = shift;
        my $self =  {
                        length => shift,
                        width  => shift,
                    };
        return bless $self, $class;
        }
    sub set_width{
        my $object = shift;
        $object->{width} = shift;
        return $object->{width};
        }
    sub set_length{
        my $object = shift;
        $object->{length} = shift;
        return $object->{length};
        }
    sub get_length{
        my $object = shift;
        return $object->{length};
        }
    sub get_width{
        my $object = shift;
        return $object->{width};
        }
    sub is_square{
        my $object = shift;
        if($object->{length} == $object->{width}){
            print "Square: $object->{length} x $object->{width}\n";
            return "true";
            }
        else{
            print "Rectangle: $object->{length} x $object->{width}\n";
            return "false";
            }
        }
};

my $rect;
print "Let's build a rectangle!\n";
    my $end_condition = 0;
while($end_condition == 0){
    print "What would you like to do? [M]ake a new one, [A]lter one, [F]ind its dimensions, know if it's a [S]quare, or [E]nd?\n";
    print "Input: ";
    my $user_input = <>;
    if($user_input =~ /^m$/i){
        print "What are it's dimensions?\n";
        print "Length: ";
        chomp(my $user_length = <>);
        print "Width: ";
        chomp(my $user_width = <>);
        $rect = rectangle->new($user_length, $user_width);
        }
    elsif($user_input =~ /^a$/i){
        print "What would you like to alter? [L]ength? or [W]idth: ";
        my $user_input = <>;
        if($user_input =~ /^l$/i){
            print "new length: ";
            chomp(my $new_length = <>);
            $rect->set_length($new_length);
            }
        elsif($user_input =~ /^w$/i){
            print "new width: ";
            chomp(my $new_width = <>);
            $rect->set_width($new_width);
            }
        }
    elsif($user_input =~ /^f$/i){
        print "What would you like to know, [L]ength or [W]idth: ";
        my $user_input = <>;
        if($user_input =~/^l$/i){
            print "Length is: " . $rect->get_length() . "\n";
            }
        if($user_input =~ /^w$/i){
            print "Width is: " . $rect->get_width() . "\n";
            }
        }
    elsif($user_input =~ /^s$/i){
        $rect->is_square();
        }
    elsif($user_input =~/^e$/i){
        $end_condition = 1;
        }
    }
print "Program end.\n"