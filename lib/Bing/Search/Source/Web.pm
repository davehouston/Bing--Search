package Bing::Search::Source::Web;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::WebRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::WebRequest::Offset
Bing::Search::Role::WebRequest::Options
Bing::Search::Role::WebRequest::FileType
);


sub _build_source_name { 'Web' }

__PACKAGE__->meta->make_immutable;
