package Bing::Search::Traits::ShouldQuote;
use Moose::Role;
Moose::Util::meta_attribute_alias('ShouldQuote');

has 'should_quote' => ( 
   is => 'rw',
   isa => 'Bool',
   default => 1,
);

1;
