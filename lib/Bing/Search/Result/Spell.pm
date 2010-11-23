package Bing::Search::Result::Spell;
use Moose;
extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with qw(
   Bing::Search::Role::Result::Value
);

__PACKAGE__->meta->make_immutable;
