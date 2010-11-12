package Bing::Search::Source::InstantAnswer;
use Moose;
extends 'Bing::Search::Source';


with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Latitude
Bing::Role::SearchRequest::Longitude
);

sub _build_source_name { 'InstantAnswer' }

__PACKAGE__->meta->make_immutable;
