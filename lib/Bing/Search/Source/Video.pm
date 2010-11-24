package Bing::Search::Source::Video;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::VideoRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Adult
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::VideoRequest::Offset
Bing::Search::Role::VideoRequest::Filter
Bing::Search::Role::VideoRequest::SortBy
);

sub _build_source_name { 'Video' }

__PACKAGE__->meta->make_immutable;
