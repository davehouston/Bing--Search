package Bing::Search::Response;
use Carp;
use Moose;
use Moose::Util::TypeConstraints;
use JSON;

subtype 'Bing::Search::Response::Types::JSON'
      => as 'HashRef';

coerce 'Bing::Search::Response::Types::JSON'
   => from 'Str'
   => via { decode_json( $_ ) };

has 'data' => ( 
   is => 'rw',
   coerce => 1,
   isa => 'Bing::Search::Response::Types::JSON',
   trigger => \&_parse
);

with 'Bing::Search::Role::Response::Version';
with 'Bing::Search::Role::Response::Query';
with 'Bing::Search::Role::Response::AlterationOverride';

has 'results' => ( 
   is => 'rw',
   isa => 'ArrayRef[Bing::Search::Result]',
   default => sub { [] }
);

sub _parse { 
   my $self = shift;
   my $data = $self->data;
   my @sets;
   for my $set ( keys %{$data->{SearchResponse}} ) {
      next if $set eq 'Query';
      next if $set eq 'Version';
      next if $set eq 'AlternationOverride';
      my $class = 'Bing::Search::Result::' . $set;
      eval "require $class" or croak $@;
      my $result_list;
      if( $set eq 'Errors' ) { 
         $result_list = delete $data->{SearchResponse}->{$set};
      } else { 
         $result_list = delete $data->{SearchResponse}->{$set}->{Results};
      }
      for my $res ( @$result_list ) { 
         my $ob = $class->new( data => $res );
         $ob->_populate;
         push @sets, $ob;
      }
   }
   $self->results( \@sets );
}  

__PACKAGE__->meta->make_immutable;

