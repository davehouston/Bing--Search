package Bing::Search::Result::Image;
use Moose;
use Bing::Search::Result::Image::Thumbnail;

extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';

with 'Bing::Search::Role::Result::Width';
with 'Bing::Search::Role::Result::FileSize';
with 'Bing::Search::Role::Result::DisplayUrl';
with 'Bing::Search::Role::Result::Height';
with 'Bing::Search::Role::Result::MediaUrl';
with 'Bing::Search::Role::Result::Title';
with 'Bing::Search::Role::Result::ContentType';
with 'Bing::Search::Role::Result::Url';


has 'Thumbnail' => ( is => 'rw', isa => 'Bing::Search::Result::Image::Thumbnail' );

before '_populate' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $t = Bing::Search::Result::Image::Thumbnail->new;
   my $thumbdata = delete $data->{Thumbnail};
   $t->data( $thumbdata );
   $t->_populate();
   $self->Thumbnail( $t );
};

__PACKAGE__->meta->make_immutable;
