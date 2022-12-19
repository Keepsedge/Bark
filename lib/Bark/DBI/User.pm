package Bark::DBI::User;
use base Bark::DBI;

__PACKAGE__->table('users');
__PACKAGE__->columns(Primary=>qw/id/);
__PACKAGE__->columns(Essential=>qw/username email/);
__PACKAGE__->columns(Others=>qw/active/);

__PACKAGE__->set_up_table("users");

1;
__EMD__