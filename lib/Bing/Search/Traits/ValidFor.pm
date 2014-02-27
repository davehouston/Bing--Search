package Bing::Search::Traits::ValidFor;
use Moose::Role;
use List::Util qw(first);

Moose::Util::meta_attribute_alias('ValidFor');

has 'valid_for' => ( 
   is => 'rw',
   isa => 'ArrayRef',
);

sub validate_service { 
   my( $self, $service ) = @_;
   
   return first { $_ eq $service } @{$self->valid_for}; 

}

1;
