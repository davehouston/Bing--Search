package Bing::Search::Role::TranslationRequest::SourceLanguage;
use Moose::Role;
use Carp;

requires 'build_request';
requires 'params';
requires '_translation_langauge_list';

has 'Translation_SourceLangauge' => (
   is => 'rw',
   lazy_build => 1
);

sub _build_Translation_SourceLanguage { } 

before 'Translation_SourceLanguage' => sub { 
   my $self = shift;
   my ($param) = @_;
   my $langs = $self->_translation_language_list;
   unless( $param && exists $langs->{$param} ) { 
      croak "Unknown source langauge $param";
   }

};

before 'build_request' => sub { 
   my $self = shift;
   if( $self->has_Translation_SourceLangauge ) { 
      my $hash = $self->params;
      $hash->{'Translation.SourceLanguage'} = $self->Translation_SourceLanguage;
      $self->params( $hash );
   }
};

1;
