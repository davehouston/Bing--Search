package Bing::Search::Role::Result::Title;
use Moose::Role;
requires 'data';
requires '_populate';

has 'Title' => ( is => 'rw', isa => 'Num' );

before '_populate' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $title = delete $data->{Title};
   $self->Title( $title );
   $self->data( $data );
};

1;
