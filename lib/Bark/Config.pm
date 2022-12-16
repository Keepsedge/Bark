package Bark::Config;
use strict;
use warnings;
use Carp qw[carp];
use JSON::XS;

# Generic Config Handler for Bark Plugins to use.

sub new {
    my $this = shift;
    my $class = ref $this || $this;
    my $self = {};
    return bless($self, $class);
}

sub setConfigFile
{
    my $self = shift;
    my $filename = shift;
    if(! $filename)
    {
        carp("Empty argument for filename")
    }
    $self->{_configfile} = $filename;
}


