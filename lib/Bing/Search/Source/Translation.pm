package Bing::Search::Source::Translation;
use Moose;
extends 'Bing::Search::Source';


with qw(
Bing::Role::TranslationRequest::SourceLanguage
Bing::Role::TranslationRequest::TargetLanguage
);

sub _build_source_name { 'Translation' }

__PACKAGE__->meta->make_immutable;
