package Bing::Search::Source::MobileWeb;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::MobileWebRequest::Count';

with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Latitude
Bing::Role::SearchRequest::Longitude
Bing::Role::SearchRequest::Options
Bing::Role::MobileWebRequest::Offset
Bing::Role::MobileWebRequest::Options
);

sub _build_source_name { 'MobileWeb' }

__PACKAGE__->meta->make_immutable;
