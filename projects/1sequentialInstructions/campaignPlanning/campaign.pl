use strict;
use warnings;
use diagnostics;
#global (every year) vars
my $regular_turnout_fraction = 0.833;
my $dollars_per_solicitation = 5;
my $overhead_fraction = .25;
#these vars are per call
my $clerical_hours = .05;
my $telephone_hours = .1;
my $transport_hours = .05;
#vars from previous election
print "Enter total registered voters: ";
my $registered_voters = <>;
chomp $registered_voters;
print "Enter number registered party voters: ";
my $registered_party = <>;
chomp $registered_party;
print "Enter registered independent voters: ";
my $registered_independent = <>;
chomp $registered_independent;
print "Enter number of regular voters in our party: ";
my $regular_party = <>;
chomp $regular_party;
print "Enter number of regular independent voters: ";
my $regular_independent = <>;
chomp $regular_independent;
print "Enter total number of actual voters: ";
my $actual_voters = <>;
chomp $actual_voters;
#expected fraction of votes
print "Enter expected fraction of our party regular votes: ";
my $expected_regular = <>;
chomp $expected_regular;
print "Enter expected fraction of independent regular votes: ";
my $expected_independent = <>;
chomp $expected_independent;
print "Enter expected fraction of our party occasional votes: ";
my $expected_occasional = <>;
chomp $expected_occasional;
print "Enter expected fraction of other votes: ";
my $expected_other = <>;
chomp $expected_other;
#expected votes
my $other_fraction = (
    ($actual_voters - ($regular_turnout_fraction * ($regular_party + $regular_independent)))
    /
    ($registered_voters - ($regular_party + $regular_independent))
                    );
my $occasional_party = ($registered_party - $regular_party);
my $voting_party = int($regular_party * $regular_turnout_fraction * $expected_regular);
my $voting_independent = int($regular_independent * $regular_turnout_fraction * $expected_independent);
my $voting_occasional_party = int($occasional_party * $other_fraction * $expected_occasional);
my $registered_others = ($registered_voters - $registered_party - $regular_independent);
my $voting_others = int($registered_others * $other_fraction * $expected_other);
print "Pool 1. regular party votes = $voting_party\n";
print "Pool 2. regular independent votes = $voting_independent\n";
print "Pool 3. occasional party votes = $voting_occasional_party\n";
print "Pool 4. other votes = $voting_others\n";
my $expected_votes = ($voting_party + $voting_independent + $voting_occasional_party + $voting_others);
print "Total expected votes = $expected_votes\n\n";
my $needed_votes = (($actual_voters / 2) + 1);
print "Votes needed to win = $needed_votes\n\n";
#expected funding
print "Expected Funding\n";
print q(Enter number of early $500 donors: );
my $donors_early = (<> * 500);
chomp $donors_early;
print "Enter number of solicitation calls: ";
my $solicitation_calls = <>;
chomp $solicitation_calls;
#amount raised
my $raised = $donors_early + ($solicitation_calls * $dollars_per_solicitation);
print "Amount available for campaign = $raised\n\n";
#work plan
#the pool calls need to represent the amount in each pool
print "Call Pool 1? [yes:1, no:0]: ";
my $call_pool_1 = (<> * $regular_party);
chomp $call_pool_1;
print "Call Pool 2? [yes:1, no:0]: ";
my $call_pool_2 = (<> * $regular_independent);
chomp $call_pool_2;
print "Call Pool 3? [yes:1, no:0]: ";
my $call_pool_3 = (<> * $occasional_party);
chomp $call_pool_3;
print "Enter number of polling places: ";
my $polling_places = <>;
chomp $polling_places;
#work hours
my $pool_calls = ($call_pool_1 + $call_pool_2 + $call_pool_3);
my $clerics_total = ($pool_calls * $clerical_hours);
my $telephone_total = (($solicitation_calls * (2 * $telephone_hours)) + ($pool_calls * $telephone_hours));
my $poll_watchers = (10 * $polling_places);
my $transport_totals = ($pool_calls * $transport_hours);
my $overhead = ($overhead_fraction * ($clerics_total + $telephone_total + $poll_watchers + $transport_totals));
my $total_hours = ($overhead + $transport_totals + $poll_watchers + $telephone_total + $clerics_total);
print "Clerical hours = $clerics_total\n";
print "Telephone hours = $telephone_total\n";
print "Poll watcher hours = $poll_watchers\n";
print "Transport hours = $transport_totals\n";
print "Overhead hours = $overhead\n";
print "Total worker hours = $total_hours\n\n";
print "Enter number of workers available: ";
my $workers = <>;
chomp $workers;
my $workers_hours_per = ($total_hours / $workers);
print "Hours per worker = $workers_hours_per\n";