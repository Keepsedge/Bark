package Bark::DBI;
use base Class::DBI::SQLite;


__PACKAGE__->connection('dbi:SQLite:dbname=bark.sqlite', "","");

1;
__END__