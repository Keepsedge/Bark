package Bark::Config;
use strict;
use warnings;
use Carp qw[carp];

# Generic Config Handler for Bark Plugins to use.

sub new {
    my $this = shift;
    my $class = ref $this || $this;
    my $self = {};
    bless($self, $class);
    my %params = @_;
    if($params{file})
    {
        $self->setConfigFile($params{file});
    }
    return $self;
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

sub setValue
{
    my $self = shift;
    my ($key, $value) = @_;
    $self->{_config}->{$key} = $value;
}

sub getValue
{
    my $self = shift;
    my $key = shift;
    return $self->{_config}->{$key};
}

1;
__END__
