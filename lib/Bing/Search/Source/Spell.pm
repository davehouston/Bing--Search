package Bing::Search::Source::Spell;
use Moose;
extends 'Bing::Search::Source';


with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Options
);

sub _build_source_name { 'Spell' }

__PACKAGE__->meta->make_immutable;
