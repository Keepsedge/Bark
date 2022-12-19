use strict;
use warnings;

use Test::More tests => 1;
use Bark::DBI::User;


my $sql_users =<<EOSQL
CREATE TABLE IF NOT EXISTS users (
    id integer PRIMARY KEY,
    username varchar(32),
    email varchar(32),
    active boolean DEFAULT true
)
EOSQL
;
my $sql_userauth =<<EOSQL
CREATE TABLE IF NOT EXISTS userauth (
    id integer PRIMARY KEY,
    userid integer,
    password varchar
)
EOSQL
;

my $dbh = Bark::DBI::User->db_Main();
my $sth = $dbh->prepare($sql_users);
$sth->execute();

$sth = $dbh->prepare($sql_userauth);
$sth->execute();

pass("stub");