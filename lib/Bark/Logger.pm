package Bark::Logger;
use strict;
use warnings;

sub new 
{
    my $this = shift;
    my $class = ref $this || $this;
    my $self = {};
    bless($self, $class);
    my %params = @_;
    if($params{file})
    {
        $self->{_logfile} = $params{logfile};
    }
    return $self;
}

sub writeLogToFile
{
    my $self = shift;
    my ($level, $message) = @_;

    return undef if(!defined($level));
    return undef if(!defined($message));

    open(LOG, ">>", $self->{_logfile}) 
        or die sprintf("Unable to open log file %s\n%s", $self->{_logfile}, $!);
    
    print LOG (sprintf("[%s] %s", $level, $message));
    close LOG;
}



1;
__END__