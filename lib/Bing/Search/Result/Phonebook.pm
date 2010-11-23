package Bing::Search::Result::Phonebook;
use Moose;
extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';
   
with qw(
   Bing::Search::Role::Result::Business
   Bing::Search::Role::Result::Address
   Bing::Search::Role::Result::UserRating
   Bing::Search::Role::Result::BusinessUrl
   Bing::Search::Role::Result::City
   Bing::Search::Role::Result::CountryOrRegion
   Bing::Search::Role::Result::DisplayUrl
   Bing::Search::Role::Result::Latitude
   Bing::Search::Role::Result::Longitude
   Bing::Search::Role::Result::PhoneNumber
   Bing::Search::Role::Result::PostalCode
   Bing::Search::Role::Result::ReviewCount
   Bing::Search::Role::Result::StateOrProvince
   Bing::Search::Role::Result::Title
   Bing::Search::Role::Result::UniqueId
   Bing::Search::Role::Result::Url
);

__PACKAGE__->meta->make_immutable;
