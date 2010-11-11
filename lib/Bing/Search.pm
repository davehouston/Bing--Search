package Bing::Search;
use Moose 1.00;
use URI;
use URI::QueryParam;
use Carp;

has 'sources' => ( 
   is => 'rw',
   isa => 'ArrayRef[Bing::Search::Source]',
   predicate => 'has_sources'
);

has 'request_obj' => ( 
   is => 'rw',
   isa => 'URI'
);

sub _make_uri { 
   my ($self) = @_;
   unless( $self->has_sources ) { 
      croak "No sources means no query, yo.";
   }
   my $uri = URI->new( 'http://api.bing.net/json.aspx' );
   for my $source ( @{$self->sources} ) { 
      $uri->query_param_append( 
         %{$source->build_request}
      );
   }
   $self->request_obj( $uri );
}

sub add_source { 
   my $self = shift;
   my $source;
   if( ref $_[0] =~ /^Bing::Search::Source/ ) { 
     $source = shift @_;
   }
   if( ref $_[0] =~ 'HASHREF' ) { 
      my $source = shift @_;
      my $type = delete $source->{source};
      croak "Invalid type" unless $type;
      my $obj;
      eval { 
         $obj = "Bing::Search::Source::$type"->new( $source );
      } or croak "Problem creating new source $type:" . $@;
      $source = $obj;
   }
   if( $source ) { 
      my @list = @{$self->sources};
      push @list, $source;
      $self->sources( \@list );
   } else { 
      croak "I dun know what you tried to give me as a source, but it wasn't right.";
   }
}






__PACKAGE__->meta->make_immutable;
