
#come back anderror check
use strict;
use diagnostics;
use warnings;

#global vars
my $full_time = 40; #hours
my @employees;
#create inheritance "tree"
package Employee
{
    sub load{
        my $class = shift;
        print "employee ==> ";
        chomp(my $employee_name = <>);
        print "social security number ==> ";
        chomp(my $employee_ss = <>);
        my $self =
                    {
                        #universal traits
                        Employee_name => $employee_name,
                        Employee_ss => $employee_ss,
                    };
        return bless $self, $class;
        }
    sub to_string{
        my $employee = shift;
        print "employee: $employee->{Employee_name}\n";
        print "social security number: $employee->{Employee_ss}\n";
        print "paycheck: \$$employee->{employee_paycheck}\n";
        }
};
package Hourly
{
    use parent -norequire, "Employee";
    sub load{
        my $class = shift;
        my $employee = $class->Employee::load();
        print "hourly pay ==> ";
        chomp(my $hourly_pay = <>);
        print "Hours worked this past week ==> ";
        chomp(my $hours_worked = <>);
        print "\n";
        #the object is already made by this point and the following adds hourly fields to the employee
        $employee->{Hourly_pay} = $hourly_pay;
        $employee->{Hours_worked} = $hours_worked;
        return $employee;
        }
    sub get_earnings{
        my $employee = shift;
        my $normal_pay = $employee->{Hourly_pay};
        my $hours = $employee->{Hours_worked};
        my $total_earned = 0;
        #if more than 40 hours, separate overtime and regular hours and figure amount made for both
        if($hours > $full_time){
            my $overtime_hours = ($hours - $full_time);
            my $overtime_pay = (1.5 * $normal_pay);
            my $total_overtime = ($overtime_hours * $overtime_pay);
            my $normal_hours = ($hours - $overtime_hours); #should equal 40
            my $total_normal = ($normal_pay * $normal_hours);
            $total_earned = ($total_normal + $total_overtime);
            }
        #otherwise under overtime just find normal pay
        else{
            $total_earned = ($hours * $normal_pay);
            }
        $employee->{employee_paycheck} = $total_earned;
        ($employee->{employee_paycheck} > 1000) ? ($employee->{employee_paycheck} = 1000) : ($employee->{employee_paycheck});
        }
};
package Salaried
{
    use parent -norequire, "Employee";
    sub load{
        my $class = shift;
        my $employee = $class->Employee::load();
        print "Salary ==> ";
        chomp(my $salary = <>);
        print "\n";
        $employee->{Salary} = $salary;
        return $employee;
        }
    sub get_earnings{
        my $employee = shift;
        $employee->{employee_paycheck} = $employee->{Salary};
        ($employee->{employee_paycheck} > 1000) ? ($employee->{employee_paycheck} = 1000) : ($employee->{employee_paycheck});
    }
};
package Salaried_plus_commission
{
    use parent -norequire, "Salaried";
    sub load{
        my $class = shift;
        my $employee = $class->Employee::load();
        print "Salary ==> ";
        chomp(my $salary = <>);
        print "Sales for this past week ==> ";
        chomp(my $sales = <>);
        print "Sales commission rate (fraction paid to employee) ==> ";
        chomp(my $commission = <>);
        print "\n";
        $employee->{Salary} = $salary;
        $employee->{Sales} = $sales;
        $employee->{Commission} = $commission;
        return $employee;
        }
    sub get_earnings{
        my $employee = shift;
        $employee->{employee_paycheck} = ($employee->{Salary} + ($employee->{Sales} * $employee->{Commission}));
        ($employee->{employee_paycheck} > 1000) ? ($employee->{employee_paycheck} = 1000) : ($employee->{employee_paycheck});
        }
};

#main script
print "Number of employees: ";
my $number_employee = -1; #start with this employee
chomp(my $user_input = <>);
until($number_employee == ($user_input - 1)){
    $number_employee++;
    print "PROFILE FOR EMPLOYEE \#" . ($number_employee + 1) . ":\n";
    print "type Hourly(1), Salaried(2), Salaried Plus Commission(3)\nEnter 1, 2, or 3 ==> ";
    chomp(my $employee_type = <>);
    if($employee_type == 1){
        $employees[$number_employee] = Hourly->load();
        }
    elsif($employee_type == 2){
        $employees[$number_employee] = Salaried->load();
        }
    elsif($employee_type == 3){
        $employees[$number_employee] = Salaried_plus_commission->load();
        }
    else{print "invalid input\n"; $number_employee--; redo}
    }
print "PAYCHECK REPORT:\n\n";
my $array_i = 0;
foreach(@employees){
    my $employee = $employees[$array_i++];
    $employee->get_earnings();
    $employee->to_string();
}