package Bing::Search::Source;
use Moose;
use URI;

has 'params' => ( is => 'rw', isa => 'HashRef' );
has 'request_obj' => ( is => 'rw', isa => 'URI' );
has 'base' => ( is => 'rw', isa => 'Str', default => 'http://api.bing.net/json.aspx' );


sub build_request { 
   my $self = shift;
   my $uri = URI->new( $self->base );
   $uri->query_form( $self->params );
   $self->request_obj( $uri );
   return $uri;
}

__PACKAGE__->meta->make_immutable;
