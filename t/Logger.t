use strict;
use warnings;
use Test::More tests=>1;

use_ok("Bark::Logger");
use Bark::Logger;

my $logger = Bark::Logger->new( logfile => 'logfile.log' );


$logger->writeLogTofile("DEBUG", "This is a test.");
my $output = `cat logfile.log`;

print STDERR ($output);
