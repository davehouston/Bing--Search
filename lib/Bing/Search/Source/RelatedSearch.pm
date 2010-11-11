package Bing::Search::Source::Related;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::WebRequest::Count';

with qw(
Bing::Role::SearchRequest::AppId
Bing::Role::SearchRequest::Query
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
);



__PACKAGE__->meta->make_immutable;
