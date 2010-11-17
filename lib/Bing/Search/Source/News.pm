package Bing::Search::Source::News;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::NewsRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::NewsRequest::Offset
Bing::Search::Role::NewsRequest::LocationOverride
Bing::Search::Role::NewsRequest::Category
Bing::Search::Role::NewsRequest::SortBy
);

sub _build_source_name { 'News' }

__PACKAGE__->meta->make_immutable;
