package Bark::DBI;
use base Class::DBI;

__PACKAGE__->connection("dbi:SQLite:dbfile=bark.dbfile", "","", {AutoCommit=>1});

1;
__END__