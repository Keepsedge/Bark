package Bark::Plugins::User;
use strict;
use warnings;

use Bark::DBI::User;
use Bark::Utils;
use Bark::Logger;

# All Bark plugins must have a load method which servs as
#   a constructor. We don't use 'new()' as under some circumstances
#   it can collide with the plugin loader's new() method. Something
#   gets swapped on the symbol table causing really strange behaviour.
sub load
{
    my $this = shift;
    my $class = ref $this || $this;
    my $self = {};
    bless($self, $class);
        $self->{_logger} = Bark::Logger->new();
    return $self;
}

sub getUserById
{
    my $self = shift;
    my %params = @_;
    if(! %params{id}) {
        $self->{_logger}->error("Call to getUserById requires argument 'id'");
        return undef;
    }

    my $user = Bark::DBI::User->retrieve(id=>$params{id});
    if(! defined($user)) {
        $self->{_logger}->error(sprintf("Unable to locate object with id %s", $params{id}));
        return undef;
    }
    return $user;
}

sub getUserByUsername
{
    my $self = shift;
    my %params = @_;
    if(! $params{username}) {
        $self->{_logger}->error("Call to getUserByUsername requires argument 'username'");
        return undef;
    }

    my $user = Bark::DBI::User->retrieve(username=>$params{username});
    if(!defined($user)) {
        $self->{_logger}->error(sprintf("Unable to locate object with username %s.", $params{username}));
        return undef;
    }
    return $user;
}

sub getUserByEmail
{
    my $self = shift;
    my %params = @_;
    if(! $params{email}) {
        $self->{_logger}->error("Call to getUserByEmail requires argument 'email'");
        return undef;
    }

    my $user = Bark::DBI::User->retrieve(email=>$params{email});
    if(!defined($user)) {
        $self->{_logger}->error(sprintf("Unable to locate object with email %s", $params{email}));
        return undef;
    }
    return $user;
}

sub addUser
{
    my $self = shift;
    my %params = @_;
    my $error = 0;
    if(! $params{username}) {
        $self->{_logger}->error("Call to addUser requires argument 'username'");
        $error = $error +1;
    }
    if(! $params{password}) {
        $self->{_logger}->error("Call to addUser requires argument 'password'");
        $error = $error +1;
    }
    if(! $params{email}) {
        $self->{_logger}->error("Call to addUser requires argument 'email'");
        $error = $error +1;
    }

    my $user = Bark::DBI::User->insert({
        username=>$params{username},
        email=>$params{email}
    });

    if(!defined($user)) {
        $self->{_logger}->severe("Unable to create new record for user.");
        return undef;
    }

    my $auth = Bark::DBI::UserAuth->insert({
        userid => $user->id(),
        password=> Bark::Utils->hashValue($params{password})
    });
    return $user;
}


