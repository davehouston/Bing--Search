package Bing::Search;
use Moose;
use Moose::Util::TypeConstraints;
use Bing::Search::Traits::RequestParam;
use Bing::Search::Traits::ShouldQuote;
use URI;
use URI::Escape;
use Data::Dumper;

sub _build_query { 
   my $self = shift;
   return $self->uri;
}

# Does the heavy lifting building a query.
sub uri {    
   my $self = shift;
   my $uri = $self->_endpoint;
   
   # set the proper path
   $uri->path_segments( $uri->path_segments, $self->service_operation );
   
   my $query_params = {};
   # Find all the attributes with a RequestParam trait
   for my $attr_name ( $self->meta->get_attribute_list ) { 
      my $attribute = $self->meta->get_attribute( $attr_name );
      if( $attribute->can('validate_param') ) { 
         # We've got a validation-required attribute here.
         my $attr_val = $self->$attr_name();
         my $val = $attribute->validate( $attr_val );
         die $val->{'error'} if $val;
      }
      
      if( $attribute->can('param') ) {
         next unless $self->$attr_name();
        
         # Check the valid_for attribute.
         if( $attribute->can('valid_for') ) { 
            next unless $attribute->valid_for( $self->service_operation ); 
         }

         my $key = $attribute->param;
         my $value;
         
         if( $attribute->type_constraint->name eq 'Bing::Search::OptionList' ) { 
            #Munge this into a +-joined string instead of an array.
            $value = join( '+', @{$self->$attr_name()} );    
         } else { 
            $value = $self->$attr_name();
         }
         $value = uri_escape( $value );
         $value = "%27$value%27" if( $attribute->should_quote );
      
         $query_params->{"$key"} = $value;
      }
   }
  
   $uri->query( join('&', map { join('=', $_, $query_params->{$_} ) } keys %$query_params ) );
   return $uri;
}

# Type for the sources list
subtype 'Bing::Search::OptionList' 
   => as 'ArrayRef';

# Type for any URI 
subtype 'Bing::Search::URI'
   => as 'URI';

# Type coercion for the sources list.
coerce 'Bing::Search::OptionList'
   => from 'Str'
   => via { [  grep { $_ } split(/,|\s+/) ] };

coerce 'Bing::Search::URI'
   => from 'Str'
   => via { URI->new( $_ ) };

has 'query' => (
   is => 'rw',
   isa => 'Str',
   required => 1,
   documentation => 'The query string.',
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Query',
);

has 'sources' => ( 
   is => 'rw',
   isa => 'Bing::Search::OptionList',
   lazy_build => 1,
   coerce => 1,
   documentation => 'An arrayref containing the names of the sources to query',
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Sources'
);

has '_endpoint' => (
   is => 'rw',
   isa => 'Bing::Search::URI',
   coerce => 1,
   lazy_build => 1,
   documentation => 'The service endpoint',
);

sub _build__endpoint { 'https://api.datamarket.azure.com/Bing/Search' }

has 'top' => (
   is => 'rw',
   isa => 'Num',
   documentation => 'Number of results to return.',
   traits => ['RequestParam', 'ShouldQuote'],
   param => '$top',
   should_quote => 0,
);

has 'skip' => ( 
   is => 'rw',
   isa => 'Num',
   documentation => 'Where to start returning results (starting point, offset, etc.)',
   traits => ['RequestParam', 'ShouldQuote'],
   param => '$skip',
   should_quote => 0,
);

has 'format' => ( 
   is => 'rw',
   isa => 'Str',
   documentation => 'Response format.',
   traits => ['RequestParam', 'ShouldQuote'],
   param => '$format',
   should_quote => 0,
   default => 'JSON'
);

has 'service_operation' => ( 
   is => 'rw',
   isa => 'Str',
   lazy_build => 1,
);

sub _build_service_operation { 'Composite' }

has 'adult' => ( 
   is => 'rw',
   isa => 'Str',
   documentation => 'The adult filter',
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Adult'
);

has 'latitude' => ( 
   is => 'rw',
   isa => 'Num',
   documentation => 'Lattitude',
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Latitude'
);

has 'longitude' => ( 
   is => 'rw',
   isa => 'Num',
   documentation => 'Longitude',
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Longitude'
);

has 'market' => ( 
   is => 'rw',
   isa => 'Str',
   documentation => 'The market',
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Market'
);

has 'options' => ( 
   is => 'rw',
   isa => 'Bing::Search::OptionList',
   coerce => 1,
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'Options'
);

has 'web_options' => ( 
   is => 'rw',
   isa => 'Bing::Search::OptionList',
   coerce => 1,
   traits => ['RequestParam', 'ShouldQuote'],
   param => 'WebOptions'
);



__PACKAGE__->meta->make_immutable;
