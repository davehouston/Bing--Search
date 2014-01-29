package Bing::Search::Traits::RequestParam;
use Moose::Role;
Moose::Util::meta_attribute_alias('RequestParam');

has 'param' => ( 
   is => 'rw',
   isa => 'Str',
);

1;
