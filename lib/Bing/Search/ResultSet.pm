package Bing::Search::ResultSet;
use Moose;

has 'name' => ( is => 'rw', isa => 'Str' );
has 'results' => ( is 'rw', isa => 'ArrayRef[Bing::Search::Result]' );



__PACKAGE__->meta->make_immutable;
