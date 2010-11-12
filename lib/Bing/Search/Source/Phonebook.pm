package Bing::Search::Source::Phonebook;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Role::PhonebookRequest::Count';

with qw(
Bing::Role::SearchRequest::Market
Bing::Role::SearchRequest::Version
Bing::Role::SearchRequest::Adult
Bing::Role::SearchRequest::UILanguage
Bing::Role::SearchRequest::Latitude
Bing::Role::SearchRequest::Longitude
Bing::Role::SearchRequest::Radius
Bing::Role::SearchRequest::Options
Bing::Role::PhonebookRequest::Offset
Bing::Role::PhonebookRequest::FileType
Bing::Role::PhonebookRequest::LocId
Bing::Role::PhonebookRequest::SortBy
);

sub _build_source_name { 'Phonebook' }

__PACKAGE__->meta->make_immutable;
