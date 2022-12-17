use strict;
use warnings;
use Test::More tests=>1;

use_ok("Bark::Logger");
use Bark::Logger;

my $logger = Bark::Logger->new( file => 'logfile.log' );


$logger->writeLogToFile("DEBUG", "This is a test.");
my $output = `cat logfile.log`;

print STDERR ($output);
