use strict;
use diagnostics;
use warnings;

#create routines
#syntax: RELATIONSHIP_STATUS() [EMPTY]
sub RELATIONSHIP_STATUS{{
    #get relationship status
    print "Are you [S]ingle, [M]arried, or [C]ohabiting?" , "\n" , "Enter s, m, or c ==> ";
    chomp(my $user_input = <>);
    print "\n";
    ($user_input =~ /(s|m|c)/i) ? (my $relationship_status = $user_input) : ((print "invalid entry\n\n") , redo);
    return $relationship_status;
    }}

#syntax: GROSS_INCOME() [EMPTY]
sub GROSS_INCOME{{
    print "Gross income ==> ";
    chomp(my $user_input = <>);
    print "\n";
    $user_input =~ (/\d/) ? (my $gross_income = $user_input) : ((print "Invalid input, try again") , redo);
    return $gross_income;
    }}

sub EXEMPTIONS{{
    print "Number of exemptions ==> ";
    chomp(my $user_input = <>);
    print "\n";
    ($user_input =~ /\d/) ? (my $exemptions = $user_input) : ((print "Invalid input, try again") , redo);
    return $exemptions;
}}

#syntax: TAX_RATE(#relationship_status , $taxable_income)
sub TAX_RATE{
    (my $relationship_status , my $taxable_income)= @_;
    my $tax_rate;
    if($relationship_status =~ /s/i){
        #20% tax rate
        $tax_rate = .2;
        }
    if($relationship_status =~ /m/i){
        #25% tax rate
        $tax_rate = .25;
        }
    if($relationship_status =~ /c/i){
        if($taxable_income < 20000){
            #10% tax rate
            $tax_rate = .1;
            }
        if($taxable_income >= 20000 && $taxable_income <= 50000){
            # 15% tax rate
            $tax_rate = .15;
            }
        if($taxable_income > 50000){
            #30% tax rate
            $tax_rate = .3;
            }
        }
    return $tax_rate;
    }

#Main script, syntax: CALCULATE_INCOME_TAX(RELATIONSHIP_STATUS , GROSS_INCOME , EXEMPTIONS)
sub CALCULATE_INCOME_TAX{
    my $exemption_amount = 1000;
    #does the math for income tax
    #take some input from outside
    (my $relationship_status , my $gross_income , my $exemptions) = @_;
    #actually calculate the income tax
    my $taxable_income = ($gross_income - ($exemption_amount * $exemptions));
    if ($taxable_income < 0){
        $taxable_income = 0;
    }
    my $tax_rate = TAX_RATE($relationship_status , $taxable_income);
    my $tax_owed = ($taxable_income * $tax_rate);
    return ($tax_rate , $taxable_income , $tax_owed);
    }

sub NEXT_CUSTOMER{{
    print "Process another customer? (y/n): ";
    my $user_input = <>;
    unless($user_input =~ /y|n/i){
        print "Invalid answer, try again";
        redo;
        }
    return $user_input;
    }}
#Session script
do{
(my $tax_rate , my $taxable_income , my $tax_owed) = CALCULATE_INCOME_TAX(RELATIONSHIP_STATUS , GROSS_INCOME , EXEMPTIONS);
print "Tax Summary\n\n";
#turn tax rate into a percentage
$tax_rate *= 100; 
print
    "Tax rate: $tax_rate \%\n",
    "Taxable income: \$$taxable_income \n",
    "Tax owed: \$$tax_owed\n\n";
}until(NEXT_CUSTOMER() =~ /n/i)