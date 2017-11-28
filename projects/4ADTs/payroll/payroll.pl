
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
        return bless $self;
        }
    sub get_earnings{
        my $self = shift;
        #what kind of employee?
        if($self->{Employee_type} == 1){
            $self->{employee_paycheck} = $self->Employee::Hourly::get_earnings();
            }
        elsif($self->{Employee_type} == 2){
            $self->{employee_paycheck} = $self->Employee::Salaried::get_earnings();
            }
        elsif($self->{Employee_type} == 3){
            $self->{employee_paycheck} = $self->Employee::Salaried_plus_commission::get_earnings();
            }
        if($self->{employee_paycheck} > 1000){
            $self->{employee_paycheck} = 1000;
        }
    }
    sub to_string{
        my $employee = shift;
        print "employee: $employee->{Employee_name}\n";
        print "social security number: $employee->{Employee_ss}\n";
        print "paycheck: \$$employee->{employee_paycheck}\n";
        }
};
package Employee::Hourly
{
    use parent -norequire, "Employee";
    sub load{
        #passes object creation to main class
        my $employee = Employee::load();
        print "hourly pay ==> ";
        chomp(my $hourly_pay = <>);
        print "Hours worked this past week ==> ";
        chomp(my $hours_worked = <>);
        print "\n";
        #the object is already made by this point and the following adds hourly fields to the employee
        $employee->{Hourly_pay} = $hourly_pay;
        $employee->{Hours_worked} = $hours_worked;
        $employee->{Employee_type} = 1; 
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
        return $total_earned;
        }
};
package Employee::Salaried
{
    use parent -norequire, "Employee";
    sub load{
        my $employee = Employee::load();
        print "Salary ==> ";
        chomp(my $salary = <>);
        print "\n";
        $employee->{Salary} = $salary;
        $employee->{Employee_type} = 2;
        return $employee;
        }
    sub get_earnings{
        my $employee = shift;
        return $employee->{Salary};
    }
};
package Employee::Salaried_plus_commission
{
    use parent -norequire, "Salaried";
    sub load{
        my $employee = Employee::load();
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
        $employee->{Employee_type} = 3;
        return $employee;
        }
    sub get_earnings{
        my $employee = shift;
        return ($employee->{Salary} + ($employee->{Sales} * $employee->{Commission}));
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
        $employees[$number_employee] = Employee::Hourly::load();
        }
    elsif($employee_type == 2){
        $employees[$number_employee] = Employee::Salaried::load();
        }
    elsif($employee_type == 3){
        $employees[$number_employee] = Employee::Salaried_plus_commission::load();
        }
    else{print "invalid input\n"; $number_employee--; redo}
    }
print "PAYCHECK REPORT:\n\n";
my $array_i = 0;
foreach(@employees){
    my $employee = $employees[$array_i++];
    $employee->Employee::get_earnings();
    $employee->Employee::to_string();
}