package Bing::Search::Source::Translation;
use Moose;
extends 'Bing::Search::Source';

with qw(
Bing::Search::Role::TranslationRequest::SourceLanguage
Bing::Search::Role::TranslationRequest::TargetLanguage
);

sub _build_source_name { 'Translation' }



__PACKAGE__->meta->make_immutable;
