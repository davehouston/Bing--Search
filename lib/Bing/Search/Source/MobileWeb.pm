package Bing::Search::Source::MobileWeb;
use Moose;
extends 'Bing::Search::Source';

with 'Bing::Search::Role::MobileWebRequest::Count';

with qw(
Bing::Search::Role::SearchRequest::Market
Bing::Search::Role::SearchRequest::Version
Bing::Search::Role::SearchRequest::Latitude
Bing::Search::Role::SearchRequest::Longitude
Bing::Search::Role::SearchRequest::Options
Bing::Search::Role::MobileWebRequest::Offset
Bing::Search::Role::MobileWebRequest::Options
);

sub _build_source_name { 'MobileWeb' }

__PACKAGE__->meta->make_immutable;

=head1 NAME

Bing::Search::Source::MobileWeb - Source for MobileWeb documents

=head1 METHODS

Like all others, C<Market>, C<Version>, C<Latitude>, C<Longitude>, and C<Options>
are standard.

=over 3

=item C<MobileWeb_Count>, C<MobileWeb_Offset>

The number of documents to return, and the offset.

=item C<MobileWeb_Options>

Like C<Options>, 
