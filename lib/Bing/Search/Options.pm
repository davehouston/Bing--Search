package Bing::Search::Options;
use Moose;
use Bing::Search::Traits::RequestParam;

has '_options' => ( 
   is => 'rw',
   isa => 'ArrayRef',
   traits => ['RequestParam'],
   param => 'Options',
   handles => { 

__PACKAGE__->meta->make_immutable;

