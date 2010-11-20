package Bing::Search::Role::Result::DateTime;
use Moose::Role;
requires 'data';
requires '_populate';

has 'DateTime' => ( is => 'rw', isa => 'Num' );

# TODO: Seriously, parse this into a DateTime object

before '_populate' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $date = delete $data->{DateTime};
   $self->DateTime( $dt );
};

1;
