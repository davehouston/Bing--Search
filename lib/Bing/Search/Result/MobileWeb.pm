package Bing::Search::Result::MobileWeb;
use Moose;

extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with 'Bing::Search::Role::Result::DateTime';
with 'Bing::Search::Role::Result::Description';
with 'Bing::Search::Role::Result::DisplayUrl';
with 'Bing::Search::Role::Result::Title';
with 'Bing::Search::Role::Result::Url';

__PACKAGE__->meta->make_immutable;
