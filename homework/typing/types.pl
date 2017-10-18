#perl is dynamic so I can do
#it is common usage to /ALWAYS/ "use strict" to maintain sanity, but can't show strong typing with it on.
my $dynamic = 15;
print "$dynamic \n";
$dynamic = 'pie';
print "$dynamic \n";
#Example of weak typing
my $couches = 10;
my $movers = 2;
my $apartments = 5;
my $nonsense = ($couches - $movers - $apartments);
print "$nonsense\n";
#Example of strong typing
{
package couch;
my $couch = 10;
}
{
package movers;
my $movers = 2;
}
{
package apartments;
my $apartments = 5;
}
print my $error = ($couch - $movers - $apartments)
#perl won't return an error since "use strict" isn't on, but it can't really execute the above math because they're kind of sorta different.....
