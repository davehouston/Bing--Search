package Bing::Search::Result;
use Moose;

has 'data' => ( 
   is => 'rw',
   isa => 'HashRef',
   required => 1,
   trigger => \&_populate;
);

sub _populate { 
   # nothing here but us chickens
}
