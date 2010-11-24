package Bing::Search::Result::Video;
use Moose;
use Bing::Search::Result::Video::StaticThumbnail;

extends 'Bing::Search::Result';

with 'Bing::Search::Role::Types::UrlType';
with 'Bing::Search::Role::Types::DurationType';

with qw(
   Bing::Search::Role::Result::Title
   Bing::Search::Role::Result::SourceTitle
   Bing::Search::Role::Result::PlayUrl
   Bing::Search::Role::Result::RunTime
   Bing::Search::Role::Result::ClickThroughPageUrl
);

has 'StaticThumbnail' => ( is => 'rw', isa => 'Bing::Search::Result::Video::StaticThumbnail' );

before '_populate' => sub { 
   my $self = shift;
   my $data = $self->data;
   my $t = Bing::Search::Result::Video::StaticThumbnail->new;
   my $thumb = delete $data->{StaticThumbnail};
   $t->data( $thumb );
   $t->_populate();
   $self->StaticThumbnail( $t );
};

__PACKAGE__->meta->make_immutable;
