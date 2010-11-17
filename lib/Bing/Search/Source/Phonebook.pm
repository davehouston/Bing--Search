package Bing::Search::Source::Phonebook;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::PhonebookRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Adult
Bing::Search::Role::SearchRequest::UILanguage
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
Bing::Search::Role::SearchRequest::Radius
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::PhonebookRequest::Offset
Bing::Search::Role::PhonebookRequest::FileType
Bing::Search::Role::PhonebookRequest::LocId
Bing::Search::Role::PhonebookRequest::SortBy
);

sub _build_source_name { 'Phonebook' }

__PACKAGE__->meta->make_immutable;
