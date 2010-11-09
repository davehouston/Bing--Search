package Bing::Role::SearchRequest::Adult;
use Moose::Role;

requires 'build_request';
requires 'params';


has 'Adult' => (
   is => 'rw',
   lazy_build => 1
);

sub _build_Adult { } 

before 'Adult' => sub { 
   my $self = shift;
   my ($param) = @_;
   unless( $param =~ /off|moderate|strict/i ) { 
      die 'In setting "Adult", valid options are: off, moderate, strict';
   }
};

before 'build_request' => sub { 
   my $self = shift;
   if( $self->has_Adult ) { 
      my $hash = $self->params;
      $hash->{Adult} = $self->Adult;
      $self->params( $hash );
   }
};

1;
