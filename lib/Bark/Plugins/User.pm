package Bark::Plugins::User;
use strict;
use warnings;


# All Bark plugins must have a load method which servs as
#   a constructor. We don't use 'new()' as under some circumstances
#   it can collide with the plugin loader's new() method. Something
#   gets swapped on the symbol table causing really strange behaviour.
sub load
{
    my $this = shift;
    my $class = ref $this || $this;
    my $self = {};
    return bless($self, $class);
}




