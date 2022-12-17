use strict;
use warnings;
use Test::More tests => 3;

use_ok("Bark::Config");

my $config = Bark::Config->new(file=>"config.cfg");

$config->setValue("database.driver", "dbd:Pg");
$config->setValue("database.host", "docker.localdomain");
$config->setValue("database.port", "6789");
$config->setValue("datanase.user","webui");

is($config->getValue("database.driver"), "dbd:Pg", "getValue()");

## test writing config files
$config->writeConfigFile();

undef $config;

my $cfg = Bark::Config->new(file=>"config.cfg");

is($cfg->getValue("database.driver"), "dbd:Pg", "getValue() after write/read");

