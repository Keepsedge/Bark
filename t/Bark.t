# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Bark.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4;
BEGIN { use_ok('Bark') };
use Bark;
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $c = Bark->new();

is( $c->getVersion(), 1.000001, "Version Check.");

cmp_ok($c->getPluginCount(), '>', 0, "Plugin Loader / Plugin Count greater than zero.");

# Start the Timer Plugin
$c->{"timer"}->startTimer();
sleep(1);
$c->{"timer"}->stopTimer();
cmp_ok($c->{"timer"}->getElapsed(), ">", 0, "Plugin::Timer");