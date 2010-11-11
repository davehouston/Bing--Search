package Bing::Search::Source::News;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::NewsRequest::Count';

with qw(
Bing::Role::SearchRequest::AppId
Bing::Role::SearchRequest::Query
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
Bing::Role::NewsRequest::Offset
Bing::Role::NewsRequest::Options
Bing::Role::NewsRequest::LocationOverride
Bing::Role::NewsRequest::Category
Bing::Role::NewsRequest::SortBy
);



__PACKAGE__->meta->make_immutable;
