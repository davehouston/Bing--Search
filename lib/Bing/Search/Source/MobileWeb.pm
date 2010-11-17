package Bing::Search::Source::MobileWeb;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::MobileWebRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::MobileWebRequest::Offset
Bing::Search::Role::MobileWebRequest::Options
);

sub _build_source_name { 'MobileWeb' }

__PACKAGE__->meta->make_immutable;
