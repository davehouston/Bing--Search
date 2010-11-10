package Bing::Search::Source::Web;
use Moose;
extends 'Bing::Search::Source';

with qw(

Bing::Search::Role::SearchRequest::AppId
Bing::Search::Role::SearchRequest::Query
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::WebRequest::Count
Bing::Search::Role::WebRequest::Offset
Bing::Search::Role::WebRequest::Options
Bing::Search::Role::WebRequest::FileType
);



__PACKAGE__->meta->make_immutable;
