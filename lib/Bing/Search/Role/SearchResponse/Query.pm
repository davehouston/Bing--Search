package Bing::Role::SearchResponse::Query;
use Moose;

requires 'data';

has 'Query' => ( is => 'rw' );

before '_parse' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $bit = delete $data->{SearchResponse}->{Query}->{SearchTerms};
   $self->Version( $bit );
   $self->data( $data );
};
