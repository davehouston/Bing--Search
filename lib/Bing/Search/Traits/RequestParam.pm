package Bing::Search::Traits::RequestParam;
use Moose::Role;
Moose::Util::meta_attribute_alias('RequestParam');

has 'param' => ( 
   is => 'rw',
   isa => 'Str',
);

has 'validate_param' => ( 
   is => 'rw',
   isa => 'Bool',
   default => 0
);

sub validate { 
   my( $self, $value ) = @_;
   
   my $validator = $self->can( 'validate_' . $self->param );
   if( $validator ) { 
      my $error = $self->$validator( $value );
      return $error ? $error : undef;
   } else { 
      return undef;
   }
}

our $_validate_Options = { EnableHighlighting => 1, DisableLocationDetection => 1 };
sub validate_Options { 
   my( $self, $value ) = @_;
   for my $param ( @$value ) { 
      unless( exists $_validate_Options->{$param} ) { 
         return { error => $param . " is not an allowed parameter for Options." };
      } 
   }
   return undef;
}

sub validate_Market { 
   my( $self, $value ) = @_;

}

1;
