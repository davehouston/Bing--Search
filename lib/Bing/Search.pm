package Bing::Search;
use Moose 1.00;
use URI;
use URI::QueryParam;
use Carp;
use LWP::UserAgent;
use JSON;
use vars qw($VERSION);

$VERSION = "0.0001";
$VERSION = eval $VERSION if $VERSION =~ /_/;

has 'sources' => ( 
   is => 'rw',
   isa => 'ArrayRef[Bing::Search::Source]',
   predicate => 'has_sources',
   default => sub { [] }
);

has 'request_obj' => ( 
   is => 'rw',
   isa => 'URI'
);

has 'agent' => ( 
   is => 'rw',
   isa => 'LWP::UserAgent',
   default => sub {  LWP::UserAgent->new( agent => 'bing-search/' . $VERSION . ' libwww-perl' ) }
);

has 'AppId' => ( 
   is => 'rw',
   required => 1,
   default => 'NOAPPIDPROVIDED'
);

has 'Query' => ( 
   is => 'rw',
   isa => 'Str',
   default => ''
);

has 'response' => (
   is => 'rw',
   isa => 'Bing::Search::Response'
);


sub search { 
   my $self = shift;
   my $uri;
   if( @_ ) {
      $self->add_source( { source => 'Web' } );
      $self->Query( shift @_ );
   } 
   $self->_make_uri;

   $uri = $self->request_obj();
   my $response = $self->agent->get( $uri );
   unless( $response->is_success ) { 
      croak "Failed request: $!";
   }
   
   my $j = JSON->new->decode( $response->content );
   $self->_parse_json( $j );
}

sub _parse_json {
   # Debugging!
   use Data::Dumper;
   my( $self, $json ) = @_;
   print STDERR "\n\n\n\nEVERYONE HERE IS SOME DECODED JOSN\n\n" . Dumper( $json );
}

sub _make_uri { 
   my ($self) = @_;
   unless( $self->has_sources ) { 
      croak "No sources means no query, yo.";
   }
   my $uri = URI->new( 'http://api.bing.net/json.aspx' );
   my @source_names;
   for my $source ( @{$self->sources} ) { 
      $uri->query_param_append( 
         $source->build_request
      );
      push @source_names, $source->source_name;
   }
   $uri->query_param_append( 'Sources' => @source_names );
   $uri->query_param_append( 'AppId' => $self->AppId );
   $uri->query_param_append( 'Query' => $self->Query );
   $self->request_obj( $uri );
}

sub add_source { 
   my( $self, $source ) = @_;
   unless( $source->isa('Bing::Search::Source') ) { 
      croak "Not a valid source: $source";
   }
   my $source_list = $self->sources;
   push @$source_list, $source;
   $self->sources( $source_list );
}


__PACKAGE__->meta->make_immutable;
