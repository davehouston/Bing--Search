package Bing::Search::Source::Image;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::ImageRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Adult
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
Bing::Search::Role::SearchRequest::Options
);

with qw(
Bing::Search::Role::ImageRequest::Offset
Bing::Search::Role::ImageRequest::Filter
);

sub _build_source_name { 'Image' }

__PACKAGE__->meta->make_immutable;

