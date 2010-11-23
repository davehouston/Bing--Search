package Bing::Search::Result::Image::Thumbnail;
use Moose;

extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with 'Bing::Search::Role::Result::Width';
with 'Bing::Search::Role::Result::ContentType';
with 'Bing::Search::Role::Result::FileSize';
with 'Bing::Search::Role::Result::Height';
with 'Bing::Search::Role::Result::Url';

__PACKAGE__->meta->make_immutable;
