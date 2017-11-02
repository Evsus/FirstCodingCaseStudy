use strict;
use warnings;
use diagnostics;
#take user input
print "Enter executions of source-code statements: ";
chomp(my $statement_executions = <>);
print "Enter average instructions/statement: ";
chomp(my $instructions_per_statement = <>);
print "Enter clock rate in megahertz: ";
chomp(my $clock_rate = <>);
print "Enter average instructions/cycle: ";
chomp(my $instructions_per_cycle = <>);
print "Enter first-level cache hit fraction: ";
chomp(my $level1_cache_hit_fraction = <>);
print "Enter first-level cache swap time in microseconds: ";
chomp(my $level1_cache_swap_time = <>);
print "Enter second-level cache hit fraction: ";
chomp(my $level2_cache_hit_fraction = <>);
print "Enter second-level cache swap time in microseconds: ";
chomp(my $level2_cache_swap_time = <>);
print "Enter main memory hit fraction: ";
chomp(my $main_memory_hit_fraction = <>);
print "Enter main memory page size in bytes/page: ";
chomp(my $page_size = <>);
print "Enter disk speed in revolutions/sec: ";
chomp(my $disk_speed = <>);
print "Enter disk track length in bytes/revolution: ";
chomp(my $disk_track_length = <>);
print "\n";

#define ideal and expected execution times
my $ideal_execution_time = ((($statement_executions * $instructions_per_statement) / ($instructions_per_cycle * $clock_rate)) / 1000000);
my $miss_cache_1 = ((1 - $level1_cache_hit_fraction) * $level1_cache_swap_time);
my $miss_cache_2 = ((1 - $level1_cache_hit_fraction) * (1 - $level2_cache_hit_fraction) * $level2_cache_swap_time);
my $miss_cache_main = ((1 - $level1_cache_hit_fraction) * (1 - $level2_cache_hit_fraction) * (1 - $main_memory_hit_fraction) * (.5 / $disk_speed + $page_size / $disk_track_length * $disk_speed));
my $expected_increase = ((($miss_cache_1 + $miss_cache_2 + $miss_cache_main) * ($statement_executions * $instructions_per_statement)) / 1000000);
my $expected_execution = ($ideal_execution_time + $expected_increase);

#print the values
print "Ideal execution time = $ideal_execution_time\n";
print "Expected execution time = $expected_execution\n";