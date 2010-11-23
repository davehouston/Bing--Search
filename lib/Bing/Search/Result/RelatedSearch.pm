package Bing::Search::Result::RelatedSearch;
use Moose;
extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with qw(
   Bing::Search::Role::Result::Url
   Bing::Search::Role::Result::Title
);

__PACKAGE__->meta->make_immutable;
