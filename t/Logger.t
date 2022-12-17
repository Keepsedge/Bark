use strict;
use warnings;
use Test::More tests=>3;

use_ok("Bark::Logger");
use Bark::Logger;

my $logger = Bark::Logger->new( file => 'logfile.log' );
$logger->writeLogToFile("DEBUG", "This is a test.");
pass("writeLogToFile");


$logger->debug("Debug Message");
$logger->warn("Warning message");
$logger->error("Error Message");
$logger->severe("Severe message");
$logger->fatal("Fatal Error Message");

my $output;

 if($^O =~/mswin32/i) { $output = `type logfile.log`; }
 else { $output = `cat logfile.log` }

if($output ne "") {
    pass("Convience Methods");
} else {
    fail("Convience Methods");
}

