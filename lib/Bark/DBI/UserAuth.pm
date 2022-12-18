package Bark::DBI::UserAuth;
use base Bark::DBI;

__PACKAGE__->table("userauth");
__PACKAGE__->columns(All=>qw/id userid password/);

1;
__END__