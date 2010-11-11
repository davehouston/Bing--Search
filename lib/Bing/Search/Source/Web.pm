package Bing::Search::Source::Web;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::WebRequest::Count';

with qw(
Bing::Role::SearchRequest::AppId
Bing::Role::SearchRequest::Query
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Latitude
Bing::Role::SearchRequest::Longitude
Bing::Role::SearchRequest::Options
Bing::Role::WebRequest::Offset
Bing::Role::WebRequest::Options
Bing::Role::WebRequest::FileType
);



__PACKAGE__->meta->make_immutable;
