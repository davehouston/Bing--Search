package Bing::Search::Result::InstantAnswer::FlightStatus::Airport;
use Moose;

extends 'Bing::Search::Result';


with qw(
   Bing::Search::Role::Result::Code
   Bing::Search::Role::Result::TimeZoneOffset
   Bing::Search::Role::Result::Name
);

__PACKAGE__->meta->make_immutable;
