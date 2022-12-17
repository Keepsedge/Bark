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
        $self->{_logfile} = $params{file};
    }
    return $self;
}

sub writeLogToFile
{
    my $self = shift;
    my ($level, $message) = @_;

    return undef if(!defined($level));
    return undef if(!defined($message));

    # *NIX Only
    my $date = `date "+%m/%d/%Y %H:%M:%S"`;
    chomp($date);

    open(LOG, ">>", $self->{_logfile}) 
        or die sprintf("Unable to open log file %s\n%s", $self->{_logfile}, $!);
    
    print LOG (sprintf("[%s][%s] %s\n",$date, $level, $message));
    close LOG;
}

sub debug
{
    my $self = shift;
    my $message = shift;
    $self->writeLogToFile("DEBUG", $message);
}
sub warn
{
    my $self = shift;
    my $message = shift;
    $self->writeLogToFile("WARN", $message);
}
sub error
{
    my $self = shift;
    my $message = shift;
    $self->writeLogToFile("ERROR", $message);
}
sub severe
{
    my $self = shift;
    my $message = shift;
    $self->writeLogToFile("SEVERE", $message);
}
sub fatal
{
    my $self = shift;
    my $message = shift;
    $self->writeLogToFile("FATAL", $message);
}


1;
__END__