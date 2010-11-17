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

1;
