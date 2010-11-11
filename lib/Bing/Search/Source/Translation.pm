package Bing::Search::Source::Translation;
use Moose;
extends 'Bing::Search::Source';


with qw(
Bing::Role::SearchRequest::AppId
Bing::Role::SearchRequest::Query
Bing::Role::TranslationRequest::SourceLanguage
Bing::Role::TranslationRequest::TargetLanguage

);



__PACKAGE__->meta->make_immutable;
