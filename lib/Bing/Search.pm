package Bing::Search;
use Moose 1.00;
use Moose::Util::TypeConstraints;
use LWP;
use JSON;

has 'appid' => ( 
   is => 'ro', 
   required => 1,
   default => '70960FEFD7F90995151FCF92D6422BEB644AACE2'
# TODO: remove this for distro
);

__PACKAGE__->meta->make_immutable;
