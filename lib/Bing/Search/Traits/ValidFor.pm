package Bing::Search::Traits::ValidFor;
use Moose::Role;
use List::Util qw(first);

has 'valid_for' => ( 
   is => 'rw',
   isa => 'ArrayRef',
);

sub validate { 
   my( $self, $service ) = @_;
   
   return first { $_ eq $service } @{$self->valid_for}; 

}
