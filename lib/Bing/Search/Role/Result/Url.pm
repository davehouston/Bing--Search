package Bing::Search::Role::Result::Url;
use Moose::Role;
use Moose::Util::TypeConstraints;
use URI;

with 'Bing::Search::Role::Types::UrlType';

has 'Url' => (
   is => 'rw',
   isa => 'Bing::Search::UrlType',
   coerce => 1
);

before '_populate' => sub { 
   my( $self ) = @_;
   my $data = $self->data;
   my $url = delete $data->{Url};
   $self->Url( $url );
};

1;
