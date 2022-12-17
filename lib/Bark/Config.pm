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
        if( -e $self->{_configfile})
        {
            $self->readConfigFile();
        }
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

sub writeConfigFile
{
    my $self = shift;
    open(FH, "+>", $self->{_configfile}) 
        or die sprintf("unable to open %s", $self->{_configfile});
    
    my @keys = sort keys(%{$self->{_config}});
    foreach my $key (@keys)
    {
        print FH (sprintf("%s=%s\n",$key, $self->getValue($key)));
    }
    close FH;
}

sub readConfigFile
{
    my $self = shift;
    open(FH, "<", $self->{_configfile})
        or die sprintf("unable to open %s", $self->{_configfile});

    foreach my $line(<FH>) {
        my ($key, $value) = split("=", $line);
        $self->{_config}->{$key} = $value;
    }
    close FH;

}

1;
__END__
