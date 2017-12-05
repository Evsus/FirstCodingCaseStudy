use strict;
use diagnostics;
use warnings;

package vending_machine
{
   
    sub insert_money{
        my $object = shift;
        my $inserted_money;
        my $amount_ok = 0;
        until($amount_ok == 1){
            print "Amount of money inserted: ";
            $inserted_money = <>;
            if(($inserted_money =~ /^[0-9]+\.[0-9]+$|^[0-9]+$|^\.[0-9]+$/i) && $inserted_money > 0.00){
                $amount_ok = 1;
                print "\n";
                }
            else{
                print "Invalid payment.  Must enter positive number.\n\n";
                }
            }
        $object->{payment_sum} += $inserted_money;
        return $object;
        }
    sub select_item{
        my $object = shift;
        if($object->{payment_sum} < 0.01){
            print "Sorry, you can't select, since you haven't inserted money yet.\n\n";
            }
        else{
            my $amount_ok = 0;
            my $item_price = 0;
            until($amount_ok == 1){
                print "Selected item's price: ";
                $item_price = <>;
                print "\n";
                if(($item_price =~ /^[0-9]+\.[0-9]+$|^[0-9]+$/i) && $item_price > 0.00){
                    if(($object->{payment_sum} > $item_price) || ($object->{payment_sum} == $item_price)){
                        $amount_ok = 1;
                        $object->{payment_sum} = ($object->{payment_sum} - $item_price);
                        }
                    else{
                        print "Invalid selection.  Price exceeds payment.\n\n";
                        }
                    }
                else{
                    print "Invalid price.  Must enter a positive number.\n\n";
                    }
                }
            my $quarters = 0;
            my $dimes = 0;
            my $nickels = 0;
            my $pennies = 0;
            until($object->{payment_sum} < .25){
                $object->{payment_sum} -= .25;
                $quarters += 1;
                }
            until($object->{payment_sum} < .1){
                $object->{payment_sum} -= .1;
                $dimes += 1;
                }
            until($object->{payment_sum} < .05){
                $object->{payment_sum} -= .05;
                $nickels += 1;
                }
            until($object->{payment_sum} < .01){
                $object->{payment_sum} -= .01;
                $pennies += 1;
                }
            print   "your change is:\n",
                    "$quarters quarter(s)\n",
                    "$dimes dime(s)\n",
                    "$nickels nickel(s)\n",
                    "$pennies penny(ies)\n\n",
            }
        }
};

my $vending_obj =   {
                        payment_sum => 0,
                    };
bless $vending_obj, "vending_machine";
print "Welcome to Jereomy's vending machine!\n\n";
my $end_condition = 0;
until($end_condition == 1){
    print "Options: (i)nsert money, (s)elect an item, (q)uit\n";
    print "Enter i, s, or q ==> ";
    chomp(my $user_input = <>);
    if($user_input !~ /^i$|^s$|^q$/i){
        print "invalid selection\n\n";
        redo;
        }
    elsif($user_input =~ /^i$/i){
        $vending_obj->insert_money();
        }
    elsif($user_input =~ /^s$/i){
        $vending_obj->select_item();
        }
    elsif($user_input =~ /^q$/i){
        $end_condition = 1;
        }
    }
print "Program end.\n";