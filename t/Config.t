use strict;
use warnings;
use Test::more tests => 4;

use_ok("Bark::Config");

my $ch = Bark::Config->new();
can_ok($ch, qw/setConfigFile readConfigFile writeConfigFile setValue getValue _sort/);

my $configFile = "testConfigFile.cfg";
$ch->setConfigFile($configFile);
$ch->addValue("test.config.option", "test.config.value");
$ch->addValue("test.config.sqlite", "data.sqlite");

is($ch->getValue("test.config.option"), "test.config.value", "setValue() | getValue()");
$ch->writeConfigFile();

if(-e $configFile) {
    pass("File Creation");
} else {
    fail("File Creation");
}




