package Bing::Role::NewsRequest::Offset;
use Moose::Role;
use Carp;

requires 'build_request';
requires 'params';
requires 'News_Count';

has 'News_Offset' => (
   is => 'rw',
   isa => 'Num',
   predicate => 'has_News_Offset'
);

before 'News_Offset' => sub { 
   my( $self, $param ) = @_;
   unless( $param <= 1000 && $param >= 0 ) { 
      croak "News.Offset value of $param must be between 0 and 1,000.";      
   }
   if( $self->News_Count + $param > 1000 ) { 
      croak "The sum of News.Count and News.Offset may not exceed 1,000.";
   }
};

before 'build_request' => sub { 
   my $self = shift;
   if( $self->has_News_Offset ) { 
      my $hash = $self->params;
      $hash->{'News.Offset'} = $self->News_Count;
      $self->params( $hash );
   }
};

1;
