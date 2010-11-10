package Bing::Role::WebRequest::Count;
use Moose::Role;
use Carp;

requires 'build_request';
requires 'params';


has 'Web_Count' => (
   is => 'rw',
   isa => 'Num',
);

before 'Web_Count' => sub {
   my( $self, $param ) = @_;
   unless( $param <= 50 && $param >= 1 ) { 
      croak "Web.Count value of $param must be between 1 and 50.";      
   }
};

before 'build_request' => sub { 
   my $self = shift;
   my $hash = $self->params;
   $hash->{'Web.Count'} = $self->Web_Count;
   $self->params( $hash );
};

1;
