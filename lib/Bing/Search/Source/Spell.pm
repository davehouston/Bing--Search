package Bing::Search::Source::Spell;
use Moose;
extends 'Bing::Search::Source';


with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Options
);

sub _build_source_name { 'Spell' }

__PACKAGE__->meta->make_immutable;
