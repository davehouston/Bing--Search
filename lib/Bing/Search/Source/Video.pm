package Bing::Search::Source::Video;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::VideoRequest::Count';

with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
Bing::Role::SearchRequest::Adult
Bing::Role::VideoRequest::Offset
Bing::Role::VideoRequest::Filter
Bing::Role::VideoRequest::SortBy
);

sub _build_source_name { 'Video' }

__PACKAGE__->meta->make_immutable;
