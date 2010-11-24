package Bing::Search::Result::Errors;
use Moose;
extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with qw(
   Bing::Search::Role::Result::Code
   Bing::Search::Role::Result::Message
   Bing::Search::Role::Result::Parameter
   Bing::Search::Role::Result::HelpUrl
   Bing::Search::Role::Result::Value
);

__PACKAGE__->meta->make_immutable;
