package Bing::Search::Result::Translation;
use Moose;
extends 'Bing::Search::Result';


with qw(
   Bing::Search::Role::Result::TranslatedTerm
);

__PACKAGE__->meta->make_immutable;
