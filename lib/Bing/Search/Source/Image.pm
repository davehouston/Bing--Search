package Bing::Search::Source::Image;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::ImageRequest::Count';

with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Adult
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Latitude
Bing::Role::SearchRequest::Longitude
Bing::Role::SearchRequest::Options
);

with qw(
Bing::Role::ImageRequest::Offset
Bing::Role::ImageRequest::Filter
);

sub _build_source_name { 'Image' }

__PACKAGE__->meta->make_immutable;
