package Bing::Search::Result::Web;
use Moose;
extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with qw(
   Bing::Search::Role::Result::Url
   Bing::Search::Role::Result::CacheUrl
   Bing::Search::Role::Result::DateTime
   Bing::Search::Role::Result::Description
   Bing::Search::Role::Result::DisplayUrl
   Bing::Search::Role::Result::Title
);

__PACKAGE__->meta->make_immutable;
