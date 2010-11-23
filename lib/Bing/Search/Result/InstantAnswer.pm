package Bing::Search::Result::InstantAnswer;
use Moose;
use Bing::Search::Result::InstantAnswer::Encarta;
use Bing::Search::Result::InstantAnswer::FlightStatus;
extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with qw(
   Bing::Search::Role::Result::Url
   Bing::Search::Role::Result::Attribution
   Bing::Search::Role::Result::ContentType
   Bing::Search::Role::Result::Title
);

has 'Answer' => ( 
   is => 'rw',
);

before '_populate' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $results = delete $data->{InstantAnswerSpecificData};
   my $obj;
   if( exists $results->{Encarta} ) { 
      $obj = Bing::Search::Result::InstantAnswer::Encarta->new;
      $obj->data( $results->{Encarta} );
   } elsif( exists $results->{FlightStatus} ) { 
      $obj = Bing::Search::Result::InstantAnswer::FlightStatus->new;
      $obj->data( $results->{FlightStatus} );
   } 
   $obj->_populate;
   $self->Answer( $obj );
   
};

__PACKAGE__->meta->make_immutable;
