package Bing::Search::Source::RelatedSearch;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::WebRequest::Count';

with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
);

sub _build_source_name { 'RelatedSearch' }

__PACKAGE__->meta->make_immutable;
