package Bing::Search::Source::InstantAnswer;
use Moose;
extends 'Bing::Search::Source';


with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
);

sub _build_source_name { 'InstantAnswer' }

__PACKAGE__->meta->make_immutable;
