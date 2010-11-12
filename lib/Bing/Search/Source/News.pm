package Bing::Search::Source::News;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::NewsRequest::Count';

with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
Bing::Role::NewsRequest::Offset
Bing::Role::NewsRequest::LocationOverride
Bing::Role::NewsRequest::Category
Bing::Role::NewsRequest::SortBy
);

sub _build_source_name { 'News' }

__PACKAGE__->meta->make_immutable;
