use strict;
use warnings;
use Test::More tests => 2;

use_ok("Bark::Config");

my $config = Bark::Config->new(file=>"config.cfg");

$config->setValue("database.driver", "dbd:Pg");
$config->setValue("database.host", "docker.localdomain");
$config->setValue("database.port", "6789");
$config->setValue("datanase.user","webui");

is($config->getValue("database.driver"), "dbd:Pg", "getValue()");

## test writing config files
$config->writeConfigFile();

my $output = `cat config.cfg`;
print STDERR $output;

