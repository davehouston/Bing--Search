package Bing::Search::Result::InstantAnswer::FlightStatus;
use Moose;
use Bing::Search::Result::InstantAnswer::FlightStatus::Airport;

extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';
with 'Bing::Search::Role::Types::DateType';

with qw(
   Bing::Search::Role::Result::DepartureTerminal
   Bing::Search::Role::Result::FlightNumber
   Bing::Search::Role::Result::ArrivalGate
   Bing::Search::Role::Result::ScheduledDeparture
   Bing::Search::Role::Result::OnTimeString
   Bing::Search::Role::Result::UpdatedDeparture
   Bing::Search::Role::Result::UpdatedArrival
   Bing::Search::Role::Result::DataFreshness
   Bing::Search::Role::Result::AirlineCode
   Bing::Search::Role::Result::DepartureGate
   Bing::Search::Role::Result::StatusCode
   Bing::Search::Role::Result::ScheduledArrival
   Bing::Search::Role::Result::ArrivalTerminal
   Bing::Search::Role::Result::FlightHistoryId
   Bing::Search::Role::Result::AirlineName
   Bing::Search::Role::Result::StatusString
   Bing::Search::Role::Result::FlightName
);

has [qw(OriginAirport DestinationAirport)] => ( 
   is => 'rw',
   isa => 'Bing::Search::Result::InstantAnswer::FlightStatus::Airport'
);

before '_populate' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $dest = delete $data->{DestinationAirport};
   my $orig = delete $data->{OriginAirport};
   my $obj_dest = Bing::Search::Result::InstantAnswer::FlightStatus::Airport->new( data => $dest );
   my $obj_orig = Bing::Search::Result::InstantAnswer::FlightStatus::Airport->new( data => $orig );
   $_->_populate() for ($obj_dest, $obj_orig);
   $self->DestinationAirport( $obj_dest );
   $self->OriginAirport( $obj_orig );
};

__PACKAGE__->meta->make_immutable;
