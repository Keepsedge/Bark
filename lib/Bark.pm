package Bark;

use 5.008009;
use strict;
use warnings;

use UNIVERSAL::moniker;
use Module::Pluggable search_path=>'Bark::Plugins', initialize=>0;

our $VERSION = 1.000001;


sub new 
{
  my $this = shift;
  my $class = ref $this || $this;
  my $self;
     $self->{version} = $VERSION;
  bless($self, $class)

  my %params = @_;
  if($params{load_plugins})
  {
    $self->_initialize();
  }
  return $self;
}

sub _initialize
{
  my $self = shift;
  $self->{_plugin_count} = 0;
  foreach my $plugin ($self->plugins())
  {
    eval "use $plugin"
    if(!$@)
    {
      my $shortname = $plugin->moniker();
      $self->{$shortname} = $plugin->load();
      $self->{_plugin_count}++;
    }
    else
    {
      warn "$plugin not usable";
    }
  }
}

sub getPluginCount {
  my $self = shift;
  return $self->{_plugin_count}
}



1;
__END__

=head1 NAME

Bark - Perl extension for Data Delivery

=head1 SYNOPSIS

  use Bark;
  my $c = Bark->new(load_plugins=>1);

=head1 DESCRIPTION

Bark can be used to deliver data from any data source, for pretty much any endpoint.
Bark uses a plugin system L<Module::Pluggable> to load and instintate needed code
bases to preform tasks. Load only modules you need, to keep the code base small, and
preformant.

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<Module::Pluggable>
L<Class::DBI>
L<JSON::XS>


=head1 AUTHOR

JSullivan, E<lt>energy.keeper@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2022 by JSullivan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.32.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
