use Test::More;

use_ok('Bing::Search');
use_ok('Bing::Search::Source::Web');
my $search = new_ok('Bing::Search');

ok( $search->AppId('70960FEFD7F90995151FCF92D6422BEB644AACE2') );
#ok( $search->AppId('CHANGE THIS'), 'Setting app id' );

ok( $search->Query('yo quierro taco bell'), 'Setting query');
#   is( $search->Query(), 'rocks balls', 'Is the query still rocks?');

my $source = new_ok( 'Bing::Search::Source::Web' );

ok( $search->add_source( $source ), 'Adding Web source' );

done_testing();
