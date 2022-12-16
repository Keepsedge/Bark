package Bark::Plugins::Timer;
use 5.008009;
use strict;
use warnings;

use Time::HiRes qw/gettimeofday tv_interval/;

sub load {
    my $this = shift;
    my $class = ref $this || $this;
    my $self = {};
    return bless($self, $class);
}

sub startTimer {
    my $self = shift;
    $self->{_start} = [gettimeofday];
}

sub stopTimer {
    my $self = shift;
    $self->{_end} = [gettimeofday];
}

sub getElapsed {
    my $self = shift;
    my $start = $self->{_start};
    my $end = $self->{_end};
    my $elapsed = tv_interval($start, $end);
    return $elapsed;
}


1;
__END__