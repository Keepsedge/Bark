use strict;
use warnings;
use Data::Dumper;
use Test::More tests => 7;
use Bark;

use_ok("Bark::Plugins::User");
use Bark;

my $bark = Bark->new();

my $user = $bark->{User}->addUser(
    username=>"Test User",
    password=>"Secrete",
    email=>'test.user@email.com'
);

if(!defined($user)) {
    fail("Add User");
} else {
    pass("Add User");
}

my $id_test = $bark->{User}->getUserById( id=> 1 );
my $username_test = $bark->{User}->getUserByUsername(username=>$user->username);
my $email_test = $bark->{User}->getUserByEmail(email=>$user->email);

if(defined($id_test)) {
    pass("getUserById");
} else {
    fail("getUserById");
}

if(defined($username_test)) {
    pass("getUserByUsername");
} else {
    fail("getUserByUsername");
}

if(defined($email_test)) {
    pass("getUserByEmail");
} else {
    fail("getUserByEmail");
}

my $checkLogin = $bark->{User}->checkLogin(username=>$user->username, password=>"Secrete");
if(defined($checkLogin)) {
    pass("Check Login");
} else {
    fail("Check Login");
}

my $failLogin = $bark->{User}->checkLogin(username=>"Test User", password=>"incorrect");
if(defined($failLogin)) {
    print STDERR Dumper($failLogin);
    fail("Intentional Failed Login Check");
} else {
    pass("Intentional Failed Login Check");
}