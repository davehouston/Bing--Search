package Bing::Search::Result::Image;
use Moose;


extends 'Bing::Search::Result';




before '_populate' => sub { 
   
};

__PACKAGE__->meta->make_immutable;
