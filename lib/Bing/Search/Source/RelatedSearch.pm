package Bing::Search::Source::RelatedSearch;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::WebRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Options
);

sub _build_source_name { 'RelatedSearch' }

__PACKAGE__->meta->make_immutable;
