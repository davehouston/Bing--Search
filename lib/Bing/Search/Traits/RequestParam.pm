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


# Will validate parameters.  This is some hard-coded stuff.  Run away!
sub _validate_param { 
   my $self = shift;
   
   my $validator = '_param_' . $self->param;
   return 1 unless( $self->has( $validator ) );
   $validator = $self->$validator();



}

has '_param_Options' => ( is => 'rw', isa => 'HashRef', lazy_build => 1, );

sub _build__param_Options { 
      { DisableLocationDetection => { type => 'Bool' },
        EnableHighlighting => { type => 'Bool' }, }
} 

has '_web_options' => ( is => 'rw', isa => 'HashRef', lazy_build => 1, );

sub _build__web_options { 
   { DisableHostCollapsing => { type => 'Bool' },
     DisableQueryAlteration => { type => 'Bool' }, }
}

has '_adult' => ( is => 'rw', isa => 'HashRef', lazy_build => 1, );

sub _build__adult { 
   { _value => { ['Off', 'Moderate', 'Strict' ] } }
}



1;
