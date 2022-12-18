package Bark::DBI;
use base Class::DBI;


__PACKAGE__->connection("dbi:SQLite:dbname=test.sqlite", "","", {AutoCommit=>1});

1;
__END__