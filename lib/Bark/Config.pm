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

sub readConfigFile
{
    my $self = shift;
    open(FH "<", $self->{_configFile}) or carp "Can not open config file.\n $_";
    my %config = ();
    while(<FH>)
    {
        my $line = $_;
        my ($key, $value) = split("=",$line);
        $config{$key} = $value;
    }
    close FH;
    $self->{_config} = %config;
}

sub writeToFile
{
    my $self = shift;
    open(FH, ">+", $self->{_configfile}) or carp "Can not open config file.\n $_";
    $self->_sort();
    foreach my $key (keys(%{$self->{_config}}))
    {  
        print FH ($key."=".$self->getValue($key)."\n");
    }
    close FH;
}

sub _sort
{
    my $self = shift;
    my @keys = sort(keys($self->{_config}));
    my %config = ();
    foreach my $key (@keys) {
        $config->{$key} = $self->{_config}->{$key};
    }
    $self->{_config} = $config;
}

sub setValue
{
    my $self = shift;
    my ($key, $value) = @_;

    $self->{_config}->{$key} = $value;
    $self->_sort();
}

sub getValue
{
    my $self = shift;
    my $key = shift;
    return $self->{_config}->{$key};
}

1;
__END__
