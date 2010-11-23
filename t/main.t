use Test::More;

use_ok('Bing::Search');

my $search = new_ok('Bing::Search');

ok( $search->AppId('70960FEFD7F90995151FCF92D6422BEB644AACE2') );

ok( $search->Query('microsoft offices near redmond washington'), 'Setting query');
#   is( $search->Query(), 'rocks balls', 'Is the query still rocks?');


use_ok( 'Bing::Search::Source::Web' );
use_ok( 'Bing::Search::Source::Image' );
use_ok( 'Bing::Search::Source::News' );
use_ok( 'Bing::Search::Source::Phonebook' );
use_ok( 'Bing::Search::Source::RelatedSearch' );
#my $source = new_ok('Bing::Search::Source::Web');
my $source = new_ok( 'Bing::Search::Source::RelatedSearch' );

ok( $search->add_source( $source ), 'Adding source' );
my $res = $search->search();
use Data::Dumper;
note "***************************************\n\n\n\n\n";
note Dumper( $res );
note "**************************************\n\n\n\n\n";


done_testing();
