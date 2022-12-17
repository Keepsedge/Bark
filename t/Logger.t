use strict;
use warnings;
use Test::More tests=>1;

use_ok("Bark::Logger");
use Bark::Logger;
my $logger = Bark::Logger->new('logfile.log');


$logger->writeToLogfile("DEBUG", "This is a test.");
$output = `cat logfile.log`;

print STDERR ($output);
