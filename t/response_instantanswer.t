use strict;
use warnings;
use Test::More;
use_ok('Bing::Search');
use_ok('Bing::Search::Source::InstantAnswer');

my $encarta = new_ok( 'Bing::Search' );
ok( $encarta->AppId( '70960FEFD7F90995151FCF92D6422BEB644AACE2' ) );
ok( $encarta->Query('define rocks' ), 'setting query' );

my $source = new_ok( 'Bing::Search::Source::InstantAnswer' );
ok( $encarta->add_source( $source ) );

my $foo = $encarta->search();

use Data::Dumper;
note Dumper( $foo );

my $flight = new_ok( 'Bing::Search' );
ok( $flight->AppId( '70960FEFD7F90995151FCF92D6422BEB644AACE2' ) );
ok( $flight->Query( 'AA 100' ), 'AA flight 100' );
my $source = new_ok( 'Bing::Search::Source::InstantAnswer' );
ok( $flight->add_source( $source ) );
my $bar = $flight->search();

note Dumper( $bar );
