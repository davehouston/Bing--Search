package Bing::Search::Response;
use Carp;
use Moose;
use Moose::Util::TypeConstraint;
use JSON;

subtype 'Bing::Search::Response::Types::JSON'
   => as class_type('JSON');

coerce 'Bing::Search::Response::Types::JSON'
   => from 'Str'
   => via { decode_json( $_ ) };

has 'data' => ( 
   is => 'rw'
   coerce => 1,
   isa => 'Bing::Search::Response::Types::JSON',
   trigger => \&_parse
);

has 'result_sets' => (
   is => 'rw',
   isa => 'ArrayRef[Bing::Search::ResultSet]',
   default => sub { [] }
);

with 'Bing::Role::SearchResponse::Version';
with 'Bing::Role::SearchResponse::Query';

sub results { 
   my $self = shift;
   my @list;
   for( @{$self->result_sets} ) { 
      push @list, @{$_->resuls};
   }
   return @list;
}

sub _parse { 
   my $self = shift;
   my $data = $self->data;
   my @sets;
   for my $set ( keys %{$data->{SearchResponse}} ) { 
      my $class = 'Bing::Search::Result::' . $set;
      eval "require $class" or croak $@;
      push @sets, $class->new( data => $data->{SearchResponse->{$data} );
   }
   $self->result_sets( \@sets );
}  

__PACKAGE__->meta->make_immutable;

