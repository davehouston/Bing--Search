package Bing::Search::Result::InstantAnswer::Encarta;
use Moose;

extends 'Bing::Search::Result';


with 'Bing::Search::Role::Result::Value';


__PACKAGE__->meta->make_immutable;
