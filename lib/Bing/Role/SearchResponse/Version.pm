package Bing::Role::SearchResponse::Version;
use Moose;

requires 'data';

has 'Version' => ( is => 'rw' );

before '_parse' => sub { 
   my $self = shift;
   my $data = $self->data;
   $bit = delete $data->{SearchResponse}->{Version};
   $self->Version( $bit );
   $self->data( $data );
};
