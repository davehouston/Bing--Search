package Bing::Search::Source::Video;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::VideoRequest::Count';

with qw(
Bing::Role::SearchRequest::AppId
Bing::Role::SearchRequest::Query
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
Bing::Role::SearchRequest::Adult
Bing::Role::WebRequest::Offset
Bing::Role::WebRequest::Filters
Bing::Role::WebRequest::SortBy
);



__PACKAGE__->meta->make_immutable;
