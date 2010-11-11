package Bing::Search::Source;
use Moose;

has 'params' => ( is => 'rw', isa => 'HashRef' );
has 'source_name' => ( is => 'rw', isa => 'Str', lazy_build => 1 );

sub build_request { 
   my $self = shift;
   # anchor!  params should be a nice hashref now.
   return $self->params;
}

__PACKAGE__->meta->make_immutable;
