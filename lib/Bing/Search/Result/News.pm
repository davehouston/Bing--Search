package Bing::Search::Result::News;
use Moose;

extends 'Bing::Search::Result';
with 'Bing::Search::Role::Types::DateType';
with 'Bing::Search::Role::Types::UrlType';

with qw(
      Bing::Search::Role::Result::Snippet
      Bing::Search::Role::Result::BreakingNews
      Bing::Search::Role::Result::Source
      Bing::Search::Role::Result::Url
      Bing::Search::Role::Result::Date
      Bing::Search::Role::Result::Title
);


__PACKAGE__->meta->make_immutable;
