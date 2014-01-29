package Bing::Search;
use Moose;
use Moose::Util::TypeConstraints;
use Bing::Search::Traits::RequestParam;
use Bing::Search::Traits::ShouldQuote;
use URI;
use Data::Dumper;

sub BUILD { 
   my $self = shift;
   __PACKAGE__->meta->make_mutable;
   # Look for things that are OptionLists..
   for my $attr_name ( $self->meta->get_attribute_list ) { 
      my $attribute = $self->meta->get_attribute( $attr_name );
      if( $attribute->type_constraint->name eq 'Bing::Search::OptionList' ) { 
         # If we find one, add an around modifier to munge it into a + list
         my $method = sub { 
            my $orig = shift;
            my $self = shift;
            my $arrayref = $self->$orig( @_ );
            return join('+', @$arrayref );
         };
         $self->meta->add_around_method_modifier( $attribute->name, $method );
      }
   }
   __PACKAGE__->meta->make_immutable;
}

sub _build_query { 
   my $self = shift;
   my $uri = $self->_endpoint;
   
   # set the proper path
   $uri->path_segments( $uri->path_segments, $self->service_operation );
   
   my $query_params = {};
   # Find all the attributes with a RequestParam trait
   for my $attr_name ( $self->meta->get_attribute_list ) { 
      my $attribute = $self->meta->get_attribute( $attr_name );
      if( $attribute->can('param') ) { 
         next unless $self->$attr_name();
         my $key = $attribute->param;
         my $value = $self->$attr_name();
         if( $attribute->should_quote ) { 
            $value = "'$value'";
         }
         $query_params->{"$key"} = $value;
      }
   }

   $uri->query_form( $query_params );
   return "$uri";
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


__PACKAGE__->meta->make_immutable;
